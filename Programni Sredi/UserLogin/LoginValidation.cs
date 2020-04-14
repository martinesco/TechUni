using System;

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

            currentUserRole = (UserRoles) user.role;
            currentUserUsername = (string) user.userName;
            
            Logger.LogActivity("Successful Login");
            

            if (DateTime.Compare(user.isActive, DateTime.Now) < 0)
            {
                Logger.LogActivity("The user is INACTIVE");
            }
            
            
            return true;
        }

        public bool isUserActiv()
        {
            foreach (User user in UserData.TestUser)
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
        
        
    }
}