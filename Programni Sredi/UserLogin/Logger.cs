using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace UserLogin
{
    public static class Logger
    {
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
    }
}