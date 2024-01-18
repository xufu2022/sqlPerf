using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static ContactManager.PachadataTrainingDataSet;

namespace ContactManager
{
    public partial class Enrollments : Form
    {
        private int m_ContactId;

        public Enrollments(int contactId)
        {
            m_ContactId = contactId;
            InitializeComponent();
        }

        private void Enrollments_Load(object sender, EventArgs e)
        {
            try
            {
                this.enrollmentTableAdapter.EnrollmentsByContactId(
                    this.pachadataTrainingDataSet.Enrollment, 
                    //new System.Nullable<int>(m_ContactId));
                    m_ContactId);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void dgvEnrollments_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            //int contactId = (sender as DataGridView).Rows[e.RowIndex].Tag as int? ?? 0;
            var r = (sender as DataGridView).Rows[e.RowIndex].DataBoundItem as DataRowView;
            if (r == null) return;
            var enrol = r.Row as EnrollmentRow;
            if (e.ColumnIndex == 0 && enrol.SessionId > 0)
            {
                var s = new Database.Sessions(ConfigurationManager.ConnectionStrings["PachaData"].ConnectionString);
                var session = s.GetSessionById(enrol.SessionId);
                if (session == null) return;
                if (session.Status != null && session.Status == "C")
                {
                    e.CellStyle.BackColor = Color.OrangeRed;
                    e.CellStyle.SelectionBackColor = Color.OrangeRed;
                }
            }           
        }

    }
}
