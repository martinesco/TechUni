namespace StudentInfoSystem
{
    public class StudentData
    {
        private static Student _testStudent;
        
        public static Student TestStudent
        {
            get
            {
                return _testStudent;
            }
            private set { }
        }
    }
}