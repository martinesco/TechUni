using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;


namespace UserLogin
{
    public static class UserData
    {
        private static UserContext dbContext = new UserContext();
        private static List<User> _TestUsers;



        /*public static List<User> TestUser
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
        }*/

        //private static User _testUser;

        private static void ResetTestUserData()
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
        }

        private static bool TestUsersIfEmpty()
        {
            IEnumerable<User> queryStudents = dbContext.Users;
            int countStudents = queryStudents.Count();
            return countStudents == 0;
        }

        public static User IsUserPassCorrect(string name, string pass)
        {
            /*//List<User> asd = TestUser;
            foreach (User u in TestUser)
            {
                if (u.userName.Equals(name) && u.password.Equals(pass))
                {
                    Console.WriteLine("Ima takuv potrebitel s takava parola");
                    return u;
                }
            }*/

            User user = (from u in dbContext.Users
                         where u.userName.Equals(name) &&
                               u.password.Equals(pass)
                         select u).FirstOrDefault();
            return user;

        }

        public static void SetUserActiveTo(string name, DateTime newActivity)
        {
            User user = GetUserByUsername(name);
            user.isActive = newActivity;
            Logger.LogActivity("Activity changed for User : " + name);
            /*// List<User> users = TestUser;
            foreach (User user in TestUser) //users or userArray?
            {
                if (user.userName.Equals(name))
                {
                    user.isActive = newActivity;
                }
            }*/
        }
        private static User GetUserByUsername(string username)
        {
            return (from user in dbContext.Users
                    where user.userName == username
                    select user).First();
        }

        public static void AssignUserRole(string name, Int32 role)
        {

            UserContext context = new UserContext();
            User usr = (from u in TestUsers
                        where u.userName == name
                        select u).First();
            usr.role = role;
            context.SaveChanges();

            Logger.LogActivity("Change role " + name);

            /*List<User> users = TestUser;
            foreach (User user in users) //users or userArray?
            {
                if (user.userName.Equals(name))
                {
                    user.role = (int) role; // da vida posle sh grumne li
                }
            }*/
        }
        public static List<User> TestUsers
        {
            get
            {
                ResetTestUserData();
                return _TestUsers;
            }
            private set
            {
            }
        }

        public static void DeleteUserByFacultyNumber(string facultyNumber)
        {
            User user = (from usr in dbContext.Users
                         where usr.facNumber == facultyNumber
                         select usr).First();
            dbContext.Users.Remove(user);
            dbContext.SaveChanges();
        }
    }
}