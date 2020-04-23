using System.Collections.Generic;

namespace StudentInfoSystem
{
    public class StudentData
    {
        public static Student _testStudent;
        static private List<Student> students;

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

        
    }
}