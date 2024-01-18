using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;

namespace ContactManager
{
    public partial class Contact : Form
    {
        public Contact()
        {
            InitializeComponent();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            var c = new Database.Contacts(ConfigurationManager.ConnectionStrings["PachaData"].ConnectionString);
            var contacts = c.GetContacts(txtFirstName.Text, txtLastName.Text);

            var cts = contacts.Select(r => new ListViewItem(new string[] { r.FirstName, r.LastName })).ToArray();
            //var cts = contacts.Select(r => new string[] { r.FirstName, r.LastName }).ToArray<ListViewItem>();
            lvContacts.Items.AddRange(cts);
            //foreach (var contact in contacts)
            //{
            //    var lvi = new ListViewItem(new string[] { contact.FirstName, contact.LastName });
            //    lvContacts.Items.Add(lvi);
            //}
        }
    }
}
