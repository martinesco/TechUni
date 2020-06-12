using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Data;
using System.Data.SqlClient;

namespace StudentInfoSystem
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private StudentInfoContext context;

        public MainWindow()
        {
            InitializeComponent();
            FillStudStatusChoices();
            DataContext = this;
            context = new StudentInfoContext();
        }

        public List<string> StudStatusChoices { get; set; }

        private void FillStudStatusChoices()
        {
            StudStatusChoices = new List<string>();
            using (IDbConnection connection = new
            SqlConnection(Properties.Settings.Default.DbConnect))
            {
                string sqlquery =
                @"SELECT StatusDescr
                FROM StudStatus";
                IDbCommand command = new SqlCommand();
                command.Connection = connection;
                connection.Open();
                command.CommandText = sqlquery;
                IDataReader reader = command.ExecuteReader();
                bool notEndOfResult;
                notEndOfResult = reader.Read();
                while (notEndOfResult)
                {
                    string s = reader.GetString(0);
                    StudStatusChoices.Add(s);
                    notEndOfResult = reader.Read();
                }
            }
        }

        public bool TestStudentsIfEmpty()
        {
            IEnumerable<Student> queryStudents = context.Students;
            int countStudents = queryStudents.Count();
            return countStudents == 0;
        }


        private List<Student> getAllStudents()
        {
            return context.Students.ToList();

        }

        private void isEmptyStudentsBtn_Click(object sender, RoutedEventArgs e)
        {
            bool isEmpty = TestStudentsIfEmpty();
            if (isEmpty)
            {
                CopyTestStudents();
                MessageBox.Show("successfully added student");
            }
            else
            {
                MessageBox.Show(isEmpty.ToString());

            }
        }

        public void CopyTestStudents()
        {
            foreach (Student student in getAllStudents())
            {
                context.Students.Add(student);
            }
            context.SaveChanges();
        }

        private void marksBtn_Click(object sender, RoutedEventArgs e)
        {

            Student student = ((MainWindowVM)DataContext).Student;
            StudentInformation studentInformation = new StudentInformation();

            StudentInformationVM siVM = new StudentInformationVM(student, studentInformation);

            studentInformation.DataContext = siVM;
            studentInformation.ShowDialog();
        }
    }
}