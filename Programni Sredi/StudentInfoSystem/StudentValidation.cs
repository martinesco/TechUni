using System;
using System.Collections.Generic;
using UserLogin;

namespace StudentInfoSystem
{
    public class StudentValidation
    {

        public static Student GetStudentDataByUser(User user)
        {
            List<Student> students = StudentData.getStudents();
            return students.Find(s => s.firstName.Equals(user.userName) && s.facNumber.Equals(user.facNumber));

            /*
                        String facNum = user.facNumber;

                        if (facNum == null)
                        {
                            Console.WriteLine("Ne e posochen faculteten nomer");
                            return null;
                        }

                        user.facNumber ==

                        return new Student();
             */
        }
    }
}