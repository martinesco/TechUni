using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace UserLogin
{
    public class LoginValidation
    {
        
        private string _username { get; set; }
        private string _password { get; set; }
        private string _errorMessage { get; set; }
        private ActionOnError _actionOnError;

        //private static UserRoles currentUserRole { get; private set; }
        private static UserRoles _userRoles;
        private static string _userUsername;
        
        public delegate void ActionOnError(string errorMSg);

        public LoginValidation(string _username, string _password, ActionOnError _actionOnError)
        {
            this._username = _username;
            this._password = _password;
            this._actionOnError = _actionOnError;
            _userUsername = _username;
        }

        public bool ValidateUserInput(ref User user)
        {
            //user = UserData.TestUser;

            Boolean emptyUserName;
            emptyUserName = _username.Equals(String.Empty);
            if (emptyUserName == true)
            {
                _errorMessage = "Username not entered";
                _actionOnError(_errorMessage);
                currentUserRole = UserRoles.ANONYMOUS;
                return false;
            }

            Boolean emptyPassword;
            emptyPassword = _password.Equals(String.Empty);
            if (emptyPassword == true)
            {
                _errorMessage = "Password not entered";
                _actionOnError(_errorMessage);
                currentUserRole = UserRoles.ANONYMOUS;
                return false;
            }

            if (_username.Length < 5 || _password.Length < 5)
            {
                _errorMessage="Username || password < 5 ! try again";
                _actionOnError(_errorMessage);
                currentUserRole = UserRoles.ANONYMOUS;
                return false;
            }

            user = UserData.IsUserPassCorrect(_username, _password);

            if (user==null){
                
                _errorMessage="Nqma potrebitel s takova ime i parola!";
                _actionOnError(_errorMessage);
                currentUserRole = UserRoles.ANONYMOUS;
                return false;
            }

            currentUserRole = (UserRoles) user.role;
            currentUserUsername = (string) user.userName;
            
            Logger.LogActivity("Successful Login");
            


           /* if (DateTime.Compare(user.isActive, DateTime.Now) < 0)
            {
                Logger.LogActivity("The user is INACTIVE");
            }*/
            
            
            return true;
        }

        public bool isUserActiv()
        {
            foreach (User user in UserData.TestUsers)
            {
                
            }
            
            return true;
        }

        public static UserRoles currentUserRole
        {
            get
            {
                return _userRoles;
            }
            private set
            {
            }
        }
        public static String currentUserUsername
        {
            get
            {
                return _userUsername;
            }
            private set
            {
            }
        }


        public static bool CountFailedLog()
        {
            List<string> failed = Logger.ReadFile().Where(line => line.Contains("Fail")).Reverse().ToList();

            if (failed.Count() < 3)
            {
                return false;
            }

            DateTime now = DateTime.Now;

            List<string> first = failed[0].Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries).ToList();
            string firstDate = first[first.Count() - 1];

            TimeSpan diff = new TimeSpan(Math.Abs(now.Subtract(DateTime.Parse(firstDate)).Ticks));
            if (diff.TotalMinutes > 3)
            {
                return false;
            }

            List<string> last = failed[2].Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries).ToList();
            string lastDate = last[last.Count() - 1];

            TimeSpan difference = new TimeSpan(Math.Abs(DateTime.Parse(firstDate).Subtract(DateTime.Parse(lastDate)).Ticks));
            if (difference.TotalMinutes <= 3)
            {
                return true;
            }
            return false;
        }

    }
}