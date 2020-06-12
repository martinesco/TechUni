using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace UserLogin
{
    public static class Logger
    {

        private static LogsContext logsContext = new LogsContext();
        private static List<string> currentSessionActivities = new List<string>();

        public static void LogActivity(string activity)
        {
            string activityLine = DateTime.Now + ";" +
                                  LoginValidation.currentUserUsername + ";" +
                                  LoginValidation.currentUserRole + ";" +
                                  activity + "\n";
            currentSessionActivities.Add(activityLine);

            if (File.Exists("test.txt") == true)
            {
                File.WriteAllText("test.txt",activityLine);
            }
            
            if (File.Exists("log.txt") == true)
            {
                File.AppendAllText("log.txt", activityLine);
            }

            logsContext.Logs.Add(new Logs(LoginValidation.currentUserUsername, activity));
            logsContext.SaveChanges();

        }

        public static void GetCurrentSessionActivities()
        {
            StringBuilder stringBuilder = new StringBuilder();
            foreach (string line in currentSessionActivities)
            {
                stringBuilder.Append(line).Append(Environment.NewLine);
            }
            Console.WriteLine(stringBuilder.ToString().Trim());
            //throw new NotImplementedException();
        }

        static public List<string> ReadFile()
        {
            StringBuilder sb = new StringBuilder();
            string[] lines = File.ReadAllLines("test.txt");
            foreach (string line in lines)
            {
                sb.Append(line + " \n");
            }

            List<string> loggs = sb.ToString().Split(new string[] { "\n" }, StringSplitOptions.RemoveEmptyEntries).ToList();
            return loggs;
        }
    }
}