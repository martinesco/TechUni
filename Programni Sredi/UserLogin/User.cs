using System;

namespace UserLogin
{
    public class User
    {

        public int UserId { get; set; }

        public string userName { get; set; }
        public string password { get; set; }
        public string facNumber { get; set; }
        public int role { get; set; }
        public DateTime? created { get; set; }
        public DateTime? isActive { get; set; }

        public User(string userName, string password, string facNumber, int role, DateTime created, DateTime isActive)
        {
            this.userName = userName;
            this.password = password;
            this.facNumber = facNumber;
            this.role = role;
            this.created = created;
            this.isActive = isActive;
        }
        public User(){}

        public override string ToString()
        {
            return "Username: " + this.userName + 
                   " Password " + this.password + 
                   " FacNumber: " + this.facNumber + 
                   " Role " + this.role +
                   " Created: " + this.created +
                   " isActive: " + this.isActive;
        }
    }
}