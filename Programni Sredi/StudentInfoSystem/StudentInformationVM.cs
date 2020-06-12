using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Controls;

namespace StudentInfoSystem
{
    class StudentInformationVM
    {
        private Student _student;
        public Student Student
        {
            get { return _student; }
            set { _student = value; }
        }

        public StudentInformationVM(Student student, StudentInformation studentInformation)
        {
            Student = student;
            fillSubjectsName(studentInformation);
            fillTeachersName(studentInformation);
            fillEvaluationsName(studentInformation);
            fillStudentMarks(studentInformation);
        }
        public List<string> marks { get; set; }
        private void fillStudentMarks(StudentInformation studentInformation)
        {
            List<string> studentMarks = getStudentsMarks();
            for (int i = 1; i <= studentMarks.Count(); i++)
            {
                var mark = (Label)studentInformation.FindName("mark" + i);

                mark.Content = studentMarks.ElementAt(i - 1);

            }
        }
        private List<string> getStudentsMarks()
        {
            marks = new List<string>();

            using (IDbConnection connection = new SqlConnection(Properties.Settings.Default.DbConnect))
            {
                string sqlquery = @"SELECT mark FROM Marks WHERE student_id = " + Student.studentId;
                IDbCommand command = new SqlCommand();
                command.Connection = connection;
                connection.Open();
                command.CommandText = sqlquery;
                IDataReader reader = command.ExecuteReader();
                bool notEndOfResult;
                notEndOfResult = reader.Read();
                while (notEndOfResult)
                {
                    switch (reader.GetString(0))
                    {
                        case "-":
                            marks.Add("-");
                            break;
                        case "2":
                            marks.Add("слаб(2)");
                            break;
                        case "3":
                            marks.Add("среден(3)");
                            break;
                        case "4":
                            marks.Add("добър(4)");
                            break;
                        case "5":
                            marks.Add("мн.добър(5)");
                            break;
                        case "6":
                            marks.Add("отличен(6)");
                            break;
                        default:
                            marks.Add("неположен(2)");
                            break;
                    }

                    notEndOfResult = reader.Read();
                }
            }
            return marks;
        }

        public List<string> subjects { get; set; }
        private void fillSubjectsName(StudentInformation studentInformation)
        {
            List<string> subjectsName = getSubjectsNames();
            for (int i = 1; i <= subjectsName.Count(); i++)
            {
                var subject = (Label)studentInformation.FindName("subject" + i);

                subject.Content = subjectsName.ElementAt(i - 1);

            }
        }
        private List<string> getSubjectsNames()
        {
            subjects = new List<string>();

            using (IDbConnection connection = new SqlConnection(Properties.Settings.Default.DbConnect))
            {
                string sqlquery = @"SELECT subjectName FROM Subjects";
                IDbCommand command = new SqlCommand();
                command.Connection = connection;
                connection.Open();
                command.CommandText = sqlquery;
                IDataReader reader = command.ExecuteReader();
                bool notEndOfResult;
                notEndOfResult = reader.Read();
                while (notEndOfResult)
                {
                    subjects.Add(reader.GetString(0));
                    notEndOfResult = reader.Read();
                }
            }
            return subjects;
        }


        public List<string> teachers { get; set; }
        private void fillTeachersName(StudentInformation studentInformation)
        {
            List<string> teachersName = getTeachersNames();
            for (int i = 1; i <= teachersName.Count() ; i++)
            {
                var teacher = (Label)studentInformation.FindName("teacher" + i);

                teacher.Content = teachersName.ElementAt(i-1);
                
            }
        }
        private List<string> getTeachersNames()
        {
            teachers = new List<string>();

            using (IDbConnection connection = new SqlConnection(Properties.Settings.Default.DbConnect))
            {
                string sqlquery = @"SELECT teacher FROM Teachers";
                IDbCommand command = new SqlCommand();
                command.Connection = connection;
                connection.Open();
                command.CommandText = sqlquery;
                IDataReader reader = command.ExecuteReader();
                bool notEndOfResult;
                notEndOfResult = reader.Read();
                while (notEndOfResult)
                {
                    teachers.Add(reader.GetString(0));
                    notEndOfResult = reader.Read();
                }
            }
            return teachers;
        }


        public List<string> evaluations { get; set; }
        private void fillEvaluationsName(StudentInformation studentInformation)
        {
            List<string> evaluationsMethod = getEvaluationMethods();
            for (int i = 1; i <= evaluationsMethod.Count(); i++)
            {
                var evaluation = (Label)studentInformation.FindName("evaluation" + i);

                evaluation.Content = evaluationsMethod.ElementAt(i - 1);
            }
        }
        private List<string> getEvaluationMethods()
        {
            evaluations = new List<string>();

            using (IDbConnection connection = new SqlConnection(Properties.Settings.Default.DbConnect))
            {
                string sqlquery = @"SELECT control FROM Evaluation";
                IDbCommand command = new SqlCommand();
                command.Connection = connection;
                connection.Open();
                command.CommandText = sqlquery;
                IDataReader reader = command.ExecuteReader();
                bool notEndOfResult;
                notEndOfResult = reader.Read();
                while (notEndOfResult)
                {
                    evaluations.Add(reader.GetString(0));
                    notEndOfResult = reader.Read();
                }
            }
            return evaluations;
        }

        
    }
}
