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
    public class Session
    {
        public int SessionId { get; set; }
        public int CourseId { get; set; }
        public string LanguageCd { get; set; }
        public int RoomId { get; set; }
        public DateTime StartDate { get; set; }
        public Decimal Price { get; set; }
        public byte Note { get; set; }
        public string Status { get; set; }
        public DateTime CreationDate { get; set; }
        public byte Duration { get; set; }
        public bool IntraEntrerprise { get; set; }
        public string Comments { get; set; }
        public int TrainerId { get; set; }
    }

    class Sessions
    {
        private string _connectionString;

        public Sessions(string connectionString)
        {
            _connectionString = connectionString;
        }

        public Session GetSessionById(int SessionId)
        {
            var s = new Session();

            using (var cn = new SqlConnection(_connectionString))
            {
                cn.Open();
                using (var cmd = new SqlCommand())
                {
                    cmd.Connection = cn;
                    cmd.CommandText = String.Format(
                        @"SELECT * FROM Course.Session WHERE SessionId = {0};",
                        SessionId
                    );
                    cmd.CommandType = System.Data.CommandType.Text;

                    var reader = cmd.ExecuteReader(CommandBehavior.SingleRow);
                    if (reader.Read())
                    {
                        s.SessionId = (int)reader["SessionId"];       
                        s.CourseId = (int)reader["CourseId"];
                        s.LanguageCd = (string)reader["LanguageCd"];
                        s.RoomId = (int)reader["RoomId"];
                        s.StartDate = (DateTime)reader["StartDate"];
                        s.Price = (decimal)reader["Price"];
                        if (!reader.IsDBNull(reader.GetOrdinal("Note"))) s.Note = (byte)reader["Note"];
                        if (!reader.IsDBNull(reader.GetOrdinal("Status"))) s.Status = (string)reader["Status"];
                        s.CreationDate = (DateTime)reader["CreationDate"];
                        if (!reader.IsDBNull(reader.GetOrdinal("Duration"))) s.Duration = (byte)reader["Duration"];
                        if (!reader.IsDBNull(reader.GetOrdinal("IntraEntrerprise"))) s.IntraEntrerprise = (bool)reader["IntraEntrerprise"];
                        if (!reader.IsDBNull(reader.GetOrdinal("Comments"))) s.Comments = (string)reader["Comments"];
                        s.TrainerId = (int)reader["TrainerId"];
    }
                    reader.Close();
                }
                cn.Close();
            }
            return s;
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
