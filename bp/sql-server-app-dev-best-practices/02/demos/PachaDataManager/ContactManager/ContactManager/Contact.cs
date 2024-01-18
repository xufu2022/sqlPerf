using System;
using System.Windows.Forms;
using System.Configuration;
using System.Linq;

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
            // clearing the result
            lvContacts.Items.Clear();

            var c = new Database.Contacts(ConfigurationManager.ConnectionStrings["PachaData"].ConnectionString);
            var contacts = c.GetContacts(txtFirstName.Text, txtLastName.Text);

            var cts = from cn in contacts
                      select(new ListViewItem(new string[2] {
                            cn.FirstName, cn.LastName
                      }));
            lvContacts.Items.AddRange(cts.ToArray());

        }

        private void btnImport_Click(object sender, EventArgs e)
        {
            using (var ofd = new OpenFileDialog())
            {
                ofd.Filter = "csv files (*.csv)|*.csv|All files (*.*)|*.*";
                ofd.FilterIndex = 1;
                //if ((ofd.ShowDialog() == DialogResult.OK) && (fileStream = ofd.OpenFile()) != null)
                if (ofd.ShowDialog() == DialogResult.OK)
                {
                    var c = new Database.Contacts(ConfigurationManager.ConnectionStrings["PachaData"].ConnectionString);
                    Cursor.Current = Cursors.WaitCursor;
                    var affected = c.ImportProspectsXML(ofd.FileName);
                    Cursor.Current = Cursors.Default;
                    MessageBox.Show(String.Format("{0} prospects imported", affected),"success",MessageBoxButtons.OK,MessageBoxIcon.Information);
                }
            }
        }
    }
}
