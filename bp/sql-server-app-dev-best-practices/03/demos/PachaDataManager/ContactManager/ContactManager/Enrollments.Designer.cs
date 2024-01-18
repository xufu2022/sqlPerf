namespace ContactManager
{
    partial class Enrollments
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.dgvEnrollments = new System.Windows.Forms.DataGridView();
            this.Title = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.StartDate = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.referenceDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.discountDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.documentsSentDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.enrollmentBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.pachadataTrainingDataSet = new ContactManager.PachadataTrainingDataSet();
            this.enrollmentTableAdapter = new ContactManager.PachadataTrainingDataSetTableAdapters.EnrollmentTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEnrollments)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.enrollmentBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pachadataTrainingDataSet)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvEnrollments
            // 
            this.dgvEnrollments.AutoGenerateColumns = false;
            this.dgvEnrollments.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvEnrollments.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Title,
            this.StartDate,
            this.referenceDataGridViewTextBoxColumn,
            this.discountDataGridViewTextBoxColumn,
            this.documentsSentDataGridViewCheckBoxColumn});
            this.dgvEnrollments.DataSource = this.enrollmentBindingSource;
            this.dgvEnrollments.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvEnrollments.Location = new System.Drawing.Point(0, 0);
            this.dgvEnrollments.Name = "dgvEnrollments";
            this.dgvEnrollments.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvEnrollments.Size = new System.Drawing.Size(559, 502);
            this.dgvEnrollments.TabIndex = 0;
            this.dgvEnrollments.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgvEnrollments_CellFormatting);
            // 
            // Title
            // 
            this.Title.DataPropertyName = "Title";
            this.Title.HeaderText = "Title";
            this.Title.Name = "Title";
            // 
            // StartDate
            // 
            this.StartDate.DataPropertyName = "StartDate";
            this.StartDate.HeaderText = "StartDate";
            this.StartDate.Name = "StartDate";
            // 
            // referenceDataGridViewTextBoxColumn
            // 
            this.referenceDataGridViewTextBoxColumn.DataPropertyName = "Reference";
            this.referenceDataGridViewTextBoxColumn.HeaderText = "Reference";
            this.referenceDataGridViewTextBoxColumn.Name = "referenceDataGridViewTextBoxColumn";
            // 
            // discountDataGridViewTextBoxColumn
            // 
            this.discountDataGridViewTextBoxColumn.DataPropertyName = "Discount";
            this.discountDataGridViewTextBoxColumn.HeaderText = "Discount";
            this.discountDataGridViewTextBoxColumn.Name = "discountDataGridViewTextBoxColumn";
            // 
            // documentsSentDataGridViewCheckBoxColumn
            // 
            this.documentsSentDataGridViewCheckBoxColumn.DataPropertyName = "Documents Sent";
            this.documentsSentDataGridViewCheckBoxColumn.HeaderText = "Documents Sent";
            this.documentsSentDataGridViewCheckBoxColumn.Name = "documentsSentDataGridViewCheckBoxColumn";
            // 
            // enrollmentBindingSource
            // 
            this.enrollmentBindingSource.DataMember = "Enrollment";
            this.enrollmentBindingSource.DataSource = this.pachadataTrainingDataSet;
            // 
            // pachadataTrainingDataSet
            // 
            this.pachadataTrainingDataSet.DataSetName = "PachadataTrainingDataSet";
            this.pachadataTrainingDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // enrollmentTableAdapter
            // 
            this.enrollmentTableAdapter.ClearBeforeFill = true;
            // 
            // Enrollments
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(559, 502);
            this.Controls.Add(this.dgvEnrollments);
            this.Name = "Enrollments";
            this.Text = "Enrollments";
            this.Load += new System.EventHandler(this.Enrollments_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvEnrollments)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.enrollmentBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pachadataTrainingDataSet)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvEnrollments;
        private PachadataTrainingDataSet pachadataTrainingDataSet;
        private System.Windows.Forms.BindingSource enrollmentBindingSource;
        private PachadataTrainingDataSetTableAdapters.EnrollmentTableAdapter enrollmentTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn Title;
        private System.Windows.Forms.DataGridViewTextBoxColumn StartDate;
        private System.Windows.Forms.DataGridViewTextBoxColumn referenceDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn discountDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewCheckBoxColumn documentsSentDataGridViewCheckBoxColumn;
    }
}