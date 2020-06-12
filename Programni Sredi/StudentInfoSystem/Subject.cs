namespace StudentInfoSystem
{
    public class Subject
    {

        public string name { get; set; }
        public string lecturer { get; set; }
        public string formaNaKontrol { get; set; }
        public string zaveril { get; set; }
        public double mark { get; set; }

        public Subject(string name, string lecturer, string formaNaKontrol, string zaveril, double mark)
        {
            this.name = name;
            this.lecturer = lecturer;
            this.formaNaKontrol = formaNaKontrol;
            this.zaveril = zaveril;
            this.mark = mark;
        }

    }
}