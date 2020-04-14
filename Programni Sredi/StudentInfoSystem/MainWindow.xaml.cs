
using System.Windows;


namespace StudentInfoSystem
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void print()
        {
            txtFirstName.Text = StudentData.TestStudent.firstName;
            txtSurName.Text = StudentData.TestStudent.surName;
            txtLast.Text = StudentData.TestStudent.lastName;
            txtFaculty.Text = StudentData.TestStudent.faculty;
            txtSpecialization.Text = StudentData.TestStudent.specialization;
            txtStatus.Text = StudentData.TestStudent.status;
            txtFacNumber.Text = StudentData.TestStudent.facNumber;
            txtDegree.Text = StudentData.TestStudent.degree;
            txtPotok.Text = StudentData.TestStudent.potok.ToString();
            txtGroup.Text = StudentData.TestStudent.group.ToString();
            txtCourse.Text = StudentData.TestStudent.course.ToString();
        }

        private void txtStatus_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {

        }

        
    }
}