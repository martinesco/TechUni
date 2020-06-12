using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace StudentInfoSystem
{
    public class StudentData
    {
        public static Student _testStudent;
        private static List<Student> students;

        private static StudentInfoContext studentInfoContext = new StudentInfoContext();
       // private static StudentInfoContext context = new StudentInfoContext();

        public static List<Student> TestStudent
        {
            get
            {
                return getStudents();
            }
            private set { }
        }

        public static List<Student> getStudents()
        {
            students = new List<Student>();

            students.Add(new Student("Pastrashko", "Magarokov", "Georgiev", "FKST", "KSI", "bachelor", "polojitelen", "121214666", 2, 9, 45));
            students.Add(new Student("Kiro", "Gavrailov", "Dondukov", "FPMI", "MI", "bachelor", "prekusnal", "0112874", 1, 9, 7));
            students.Add(new Student("Tomas", "Zlatanov", "Biolojkov", "FKST", "ITI", "bachelor", "deistvasht", "503118001", 2, 9, 50));

            return students;
        }

        public static void resetStudents()
        {
            students = new List<Student>();

            students.Add(new Student("Pastrashko", "Magarokov", "Georgiev", "FKST", "KSI", "bachelor", "polojitelen", "121214666", 2, 9, 45));
            students.Add(new Student("Kiro", "Gavrailov", "Dondukov", "FPMI", "MI", "bachelor", "prekusnal", "0112874", 1, 9, 7));
            students.Add(new Student("Tomas", "Zlatanov", "Biolojkov", "FKST", "ITI", "bachelor", "deistvasht", "503118001", 2, 9, 50));

            foreach (Student student in students)
            {
                studentInfoContext.Students.Add(student);
            }
            studentInfoContext.SaveChanges();
        }


        /*  private static void ResetTestUserData()
         {
             if (TestUsersIfEmpty())
             {
                 CreateUsers();
                 foreach (User user in _TestUsers)
                 {
                     dbContext.Users.Add(user);
                 }
                 dbContext.SaveChanges();
             }
         }

         static private void CreateUsers()
         {
             _TestUsers = new List<User>();
             _TestUsers.Add(new User("Pastrashko", "zlato0", "121214666", 1, DateTime.Now, DateTime.Now.AddYears(5)));
             _TestUsers.Add(new User("Dragan", "nodiggity", "121219088", 4, DateTime.Now, DateTime.Now.AddYears(1)));
             _TestUsers.Add(new User("Mustakan", "qwerty1", "121219089", 4, DateTime.Now, DateTime.Now.AddYears(-2)));
         }*/

        public static Student IsThereStudent(String number)
        {
            StudentInfoContext context = new StudentInfoContext();

            Student result = (from st in context.Students where st.facNumber == number select st).First();
            return result;
        }

        
    }
}