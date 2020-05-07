using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace StudentInfoSystem
{
    class MainWindowVM : Observable
    {
        private Student _student;
        public Student Student
        {
            get { return _student; }
            set { _student = value; RaisePropertyChangedEvent("Student"); }
        }

        private bool _canEditProperty = true;
        public bool CanEditProperty
        {
            get { return _canEditProperty; }
            set { _canEditProperty = value; RaisePropertyChangedEvent("CanEditProperty"); }
        }

        public MainWindowVM(Student student, MainWindow element)
        {
            if (student == null)
            {
                student = new Student();
                element = new MainWindow();
            }
            Student = student;
            LoadStudentData(element);
            
        }

        public ICommand LoadStudentDataCommand
        {
            get { return new RelayCommand(LoadStudentData); }
        }


        private void LoadStudentData(MainWindow element)
        {
            element.txtFirstName.Text = Student.firstName;
            element.txtSurName.Text = Student.surName;
            element.txtLast.Text = Student.lastName;
            element.txtFaculty.Text = Student.faculty;
            element.txtSpecialization.Text = Student.specialization;
            element.txtDegree.Text = Student.degree;
            element.txtStatus.ItemsSource = element.StudStatusChoices;
            element.txtCourse.Text = Student.course.ToString();
            element.txtPotok.Text = Student.potok.ToString();
            element.txtGroup.Text = Student.group.ToString();
            element.txtFacNumber.Text = Student.facNumber.ToString();
        }


        public ICommand ClearStudentDataCommand
        {
            get { return new RelayCommand(ClearStudentData); }
        }

        private void ClearStudentData()
        {
            Student = new Student();
        }

        public ICommand DeactivateEditingCommand
        {
            get { return new RelayCommand(DeactivateEditing); }
        }

        private void DeactivateEditing()
        {
            CanEditProperty = false;
        }

        public ICommand ActivateEditingCommand
        {
            get { return new RelayCommand(ActivateEditing); }
        }

        private void ActivateEditing()
        {
            CanEditProperty = true;
        }
    }
}
