using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using UserLogin;

namespace StudentInfoSystem
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();
        }

        public static void printError(String message)
        {
            Console.WriteLine("!!! " + message + " !!!");
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            //   UserLogin.UserData.ResetTestUserData();

            LoginValidation loginValidation = new LoginValidation(txtUsername.Text, txtPassword.Password, printError);

            User user = new User();

            if (loginValidation.ValidateUserInput(ref user))
            {
                /*MainWindow anotherWindow = new MainWindow();
                anotherWindow.Show();
                Hide();*/
                Student student = StudentValidation.GetStudentDataByUser(user);
                MainWindow mainWindow = new MainWindow();
                MainWindowVM mwVM = new MainWindowVM(student, mainWindow);
                mainWindow.DataContext = mwVM;
                mainWindow.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Neshto nevalidno vavede ti!");
                TextBox usernameBox = txtUsername;
                usernameBox.Clear();
                PasswordBox passwordBox = txtPassword;
                passwordBox.Clear();

                /*MessageBox.Show("Invalid data");
                txtUsername.Clear();
                txtPassword.Clear();*/
            }
        }
    }
}
