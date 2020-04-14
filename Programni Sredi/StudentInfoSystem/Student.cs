using UserLogin;


namespace StudentInfoSystem
{
    public class Student
    {
        public string firstName { get; set; }
        public string surName { get; set; }
        public string lastName { get; set; }
        public string faculty { get; set; }
        public string specialization { get; set; }
        public string degree { get; set; }
        public string status { get; set; }
        public string facNumber { get; set; }
        public string course { get; set; }
        public string potok { get; set; }
        public string group { get; set; }


        public Student() { }

        public Student(string firstName, string surName, string lastName, string faculty, string specialization, string degree, string status, string facNumber, string course, string potok, string group)
        {
            this.firstName = firstName;
            this.surName = surName;
            this.lastName = lastName;
            this.faculty = faculty;
            this.specialization = specialization;
            this.degree = degree;
            this.status = status;
            this.facNumber = facNumber;
            this.course = course;
            this.potok = potok;
            this.group = group;
        }


    }

}