using System;
using System.IO;
using System.IO.Compression;

namespace UserLogin
{
    internal class Program
    {
        public static void pringError(string s)
        {
            Console.WriteLine("!!! " + s + " !!!");
        }
        
        public static void Main(string[] args)
        {
            Console.WriteLine("Enter username and password");
            string username = Console.ReadLine();
            string password = Console.ReadLine();

            LoginValidation check = new LoginValidation(username, password, pringError );

            User user = new User();

            if (check.ValidateUserInput(ref user))
            {
                Console.WriteLine(user.ToString());

                //Console.WriteLine("Role: " + LoginValidation.currentUserRole);

                switch (user.role)
                {
                    case 0:
                        Console.WriteLine("User is Anonymous");
                        break;
                    case 1:
                        Console.WriteLine("User is Admin");
                        break;
                    case 2:
                        Console.WriteLine("User is Inspector");
                        break;
                    case 3:
                        Console.WriteLine("User is professor");
                        break;
                    case 4:
                        Console.WriteLine("User is Student");
                        break;
                    default:
                        Console.WriteLine("Error");
                        break;
                }

                if (user.role == 1)
                {
                    adminFunction();
                }
            }
        }

        public static void adminFunction()
        {
            bool asd = true;

            while (asd)
            {
                Console.WriteLine("Select option: \n0: Exit\n1: Change user's role\n2: Change user's activity");
                Console.WriteLine("3: List with users");
                Console.WriteLine("4: Show log activity");
                Console.WriteLine("5: Show current activity");
                int input = Int32.Parse(Console.ReadLine());
                

                switch (input)
                {
                    case 0:
                        asd = false;
                        break;
                    case 1:
                        Console.WriteLine("Enter user's name and new role");
                        string username = Console.ReadLine();
                        Int32 role = Int32.Parse(Console.ReadLine());
                        
                        UserData.AssignUserRole(username,role);
                        break;
                    case 2:
                        Console.WriteLine("Enter user's name and date in SPECIAL FORMAT ");
                        string name = Console.ReadLine();
                        DateTime dateTime = DateTime.Parse(Console.ReadLine());
                        
                        UserData.SetUserActiveTo(name,dateTime);

                        foreach (User user in UserData.TestUser)
                        {
                            Console.WriteLine(user.ToString());
                        }
                        
                        break;
                    case 3:
                        foreach (User user in UserData.TestUser)
                        {
                            Console.WriteLine(user.ToString());
                        }
                        break;
                    case 4:
                        StreamReader streamReader = new StreamReader("test.txt");
                        string line;
                        while((line = streamReader.ReadLine()) != null){
                            Console.WriteLine(line);
                        }
                        break;
                    case 5:
                        Logger.GetCurrentSessionActivities();
                        break;

                    default: Console.WriteLine("Error");
                        break;
                }
            }
        }
    }
}