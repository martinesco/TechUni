using System;
using System.Collections;
using System.Collections.Generic;

namespace UserLogin
{
    public static class UserData
    {
        private static List<User> usersArray;

        public static List<User> TestUser
        {
            get
            {
                Console.WriteLine(usersArray);

                if (usersArray == null) //basikefa
                {
                    ResetTestUserData();
                }

                return usersArray;
            }
            private set { }
        }

        //private static User _testUser;

        private static void ResetTestUserData()
        {
            usersArray = new List<User>();
            usersArray.Add(new User("Pastrashko", "zlato0", "121214666", 1, DateTime.Now, DateTime.Now.AddYears(5)));
            usersArray.Add(new User("Dragan", "nodiggity", "121219088", 4, DateTime.Now, DateTime.Now.AddYears(1)));
            usersArray.Add(new User("Mustakan", "qwerty1", "121219089", 4, DateTime.Now, DateTime.Now.AddYears(-2)));
        }

        public static User IsUserPassCorrect(string name, string pass)
        {
            //List<User> asd = TestUser;
            foreach (User u in TestUser)
            {
                if (u.userName.Equals(name) && u.password.Equals(pass))
                {
                    Console.WriteLine("Ima takuv potrebitel s takava parola");
                    return u;
                }
            }

            return null;
        }

        public static void SetUserActiveTo(string name, DateTime newActivity)
        {
            // List<User> users = TestUser;
            foreach (User user in TestUser) //users or userArray?
            {
                if (user.userName.Equals(name))
                {
                    user.isActive = newActivity;
                }
            }
        }

        public static void AssignUserRole(string name, Int32 role)
        {
            List<User> users = TestUser;
            foreach (User user in users) //users or userArray?
            {
                if (user.userName.Equals(name))
                {
                    user.role = (int) role; // da vida posle sh grumne li
                }
            }
        }
    }
}