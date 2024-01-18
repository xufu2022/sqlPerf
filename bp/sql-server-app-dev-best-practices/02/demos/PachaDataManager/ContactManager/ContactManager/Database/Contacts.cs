using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Diagnostics;
using System.Data;
using System.Linq;
using System.Xml.Linq;

namespace ContactManager.Database
{
    public class Contact
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }

    class Contacts
    {
        private string _connectionString;

        public Contacts(string connectionString)
        {
            _connectionString = connectionString;
        }

        public List<Contact> GetContacts(string FirstName, string LastName)
        {
            var contacts = new List<Contact>();

            using (var cn = new SqlConnection(_connectionString))
            {
                cn.Open();
                using (var cmd = new SqlCommand())
                {
                    cmd.Connection = cn;
                    cmd.CommandText = String.Format(
                        @"SELECT ContactId, FirstName, LastName FROM Contact.Contact WHERE FirstName LIKE 
                        '%{0}%' AND LastName LIKE '%{1}%';",
                        FirstName,
                        LastName
                    );
                    cmd.CommandType = System.Data.CommandType.Text;

                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        var c = new Contact();
                        c.FirstName = reader.GetString(1);
                        c.LastName = reader.GetString(2);
                        contacts.Add(c);
                    }
                    reader.Close();
                }
                cn.Close();
            }
            return contacts;
        }

        public int ImportProspects(string filename)
        {
            int i = 0;
            using (StreamReader sr = new StreamReader(filename))
            {
                // drop the first line
                sr.ReadLine();

                using (var cn = new SqlConnection(_connectionString))
                {
                    cn.Open();
                    using (var cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = System.Data.CommandType.Text;
                        cmd.CommandText = "TRUNCATE TABLE Contact.ContactToImport;";
                        cmd.ExecuteNonQuery();

                        string line;
                        while ((line = sr.ReadLine()) != null)
                        {
                            string[] record = line.Split(',');
                            var qry = String.Format("INSERT INTO Contact.ContactToImport VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}');",
                                record[0].Replace("'", "''"),
                                record[1].Replace("'", "''"),
                                record[2].Replace("'", "''"),
                                record[3].Replace("'", "''"),
                                record[4].Replace("'", "''"),
                                record[5].Replace("'", "''"),
                                record[6].Replace("'", "''")
                                );
                            Trace.WriteLine(qry);
                            cmd.CommandText = qry;
                            cmd.ExecuteNonQuery();
                            i++;
                        }
                    }
                    cn.Close();
                }
            }
            return i;
        }

        public int ImportProspectsType(string filename)
        {
            var dtContacts = new DataTable("ContactsToImport");
            dtContacts.Columns.Add("FirstName", typeof(string));
            dtContacts.Columns.Add("LastName", typeof(string));
            dtContacts.Columns.Add("Address", typeof(string));
            dtContacts.Columns.Add("ZipCode", typeof(string));
            dtContacts.Columns.Add("City", typeof(string));
            dtContacts.Columns.Add("Phone", typeof(string));
            dtContacts.Columns.Add("Email", typeof(string));

            int i = 0;
            using (StreamReader sr = new StreamReader(filename))
            {
                // drop the first line
                sr.ReadLine();

                string line;
                while ((line = sr.ReadLine()) != null)
                {
                    string[] record = line.Split(',');

                    dtContacts.Rows.Add(record[0].Replace("'", "''"),
                        record[1].Replace("'", "''"),
                        record[2].Replace("'", "''"),
                        record[3].Replace("'", "''"),
                        record[4].Replace("'", "''"),
                        record[5].Replace("'", "''"),
                        record[6].Replace("'", "''")
                    );
                }
            }

            var ret = new SqlParameter()
                { Direction = ParameterDirection.ReturnValue };

            using (var cn = new SqlConnection(_connectionString))
            {
                cn.Open();
                using (var cmd = new SqlCommand())
                {
                    cmd.Connection = cn;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "Contact.InsertContactToImport";
                    cmd.Parameters.Add(new SqlParameter(
                        "@contact",
                        SqlDbType.Structured
                    )
                    {
                        Value = dtContacts
                    });

                    cmd.Parameters.Add(ret);

                    cmd.ExecuteNonQuery();

                    cn.Close();
                }
            }
            return (int)ret.Value;
        }

        public int ImportProspectsBulk(string filename)
        {
            var dtContacts = new DataTable("ContactsToImport");
            dtContacts.Columns.Add("FirstName", typeof(string));
            dtContacts.Columns.Add("LastName", typeof(string));
            dtContacts.Columns.Add("Address", typeof(string));
            dtContacts.Columns.Add("ZipCode", typeof(string));
            dtContacts.Columns.Add("City", typeof(string));
            dtContacts.Columns.Add("Phone", typeof(string));
            dtContacts.Columns.Add("Email", typeof(string));

            int i = 0;
            using (StreamReader sr = new StreamReader(filename))
            {
                // drop the first line
                sr.ReadLine();

                string line;
                while ((line = sr.ReadLine()) != null)
                {
                    string[] record = line.Split(',');

                    dtContacts.Rows.Add(record[0].Replace("'", "''"),
                        record[1].Replace("'", "''"),
                        record[2].Replace("'", "''"),
                        record[3].Replace("'", "''"),
                        record[4].Replace("'", "''"),
                        record[5].Replace("'", "''"),
                        record[6].Replace("'", "''")
                    );
                }
            }

            using (var cn = new SqlConnection(_connectionString))
            {
                cn.Open();

                using (var cmd = new SqlCommand())
                {
                    cmd.Connection = cn;
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.CommandText = "TRUNCATE TABLE Contact.ContactToImport;";
                    cmd.ExecuteNonQuery();
                }

                using (var bcp = new SqlBulkCopy(cn))
                {
                    bcp.DestinationTableName = "Contact.ContactToImport";
                    bcp.WriteToServer(dtContacts);
                }
                cn.Close();
            }
            return i;
        }

        public int ImportProspectsXML(string filename)
        {
            int i = 0;

            var lines = File.ReadAllLines(filename).Skip(1).ToArray();
            var contacts = new XElement("Contacts",
                from c in lines
                let fields = c.Split(',')
                select new XElement("Contact",
                    new XElement("FirstName", fields[0]),
                    new XElement("LastName",  fields[1]),
                    new XElement("Address",   fields[2]),
                    new XElement("ZipCode",   fields[3]),
                    new XElement("City",      fields[4]),
                    new XElement("Phone",     fields[5]),
                    new XElement("Email",     fields[6])
                )
            ).ToString();

            var ret = new SqlParameter()
                { Direction = ParameterDirection.ReturnValue };

            using (var cn = new SqlConnection(_connectionString))
            {
                cn.Open();

                using (var cmd = new SqlCommand())
                {
                    cmd.Connection = cn;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "Contact.InsertContactToImportXML";
                    cmd.Parameters.Add(new SqlParameter(
                        "@contacts",
                        SqlDbType.Xml
                    )
                    {
                        Value = contacts
                    });

                    cmd.Parameters.Add(ret);

                    cmd.ExecuteNonQuery();

                }

                cn.Close();
            }
            return (int)ret.Value;
        }
    }
}
