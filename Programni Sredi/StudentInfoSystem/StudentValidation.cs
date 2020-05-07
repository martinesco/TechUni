using System;
using System.Collections.Generic;
using UserLogin;

namespace StudentInfoSystem
{
    public class StudentValidation
    {

        public static Student GetStudentDataByUser(User user)
        {
            /*List<Student> students = StudentData.getStudents();
            return students.Find(s => s.firstName.Equals(user.userName) && s.facNumber.Equals(user.facNumber));*/

            return StudentData.IsThereStudent(user.facNumber);
        }
    }

}