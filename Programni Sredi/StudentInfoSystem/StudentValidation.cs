using System;
using UserLogin;

namespace StudentInfoSystem
{
    public class StudentValidation
    {

        public static Student GetStudentDataByUser(User user)
        {

            String facNum = user.facNumber;

            if (facNum == null)
            {
                Console.WriteLine("Ne e posochen faculteten nomer");
                return null;
            }

            return new Student();
            
        }
    }
}