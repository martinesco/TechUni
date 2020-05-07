using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;


namespace UserLogin
{
    class Logs
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]

        public int logsId {get; set;}
        public DateTime? date { get; set; }

        public string activity { get; set; }

        public string userName { get; set; }

        public UserRoles role { get; set; }


        public Logs()
        {

        }
        public Logs(string username, UserRoles role, string activity)
        {
            date = DateTime.Now;
            userName = username;
            role = role;
            activity = activity;
        }
        public override string ToString()
        {
            return date + " " + userName + " " + role + " " + activity + "\r\n";
        }
    }
}
