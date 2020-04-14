using System.Windows;

namespace WPFhello
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnHello_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (txtName.Text.Length < 2)
            {
                MessageBox.Show("Името трябва да е поне 2 символа");
            }
            else
            {
                MessageBox.Show("Здрасти " + txtName.Text + "!!! \nТова е твоята първа програма на Visual Studio 2019!");
            }
        }

        private void txtName_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {
           /* if (txtName.Text.Length < 2)
            {
                MessageBox.Show("Името трябва да е поне 2 символа");
            }*/
        }

        /* private void btnHello_Click(object sender, System.Windows.RoutedEventArgs e)
         {
             MessageBox.Show("Здрасти!!! Това е твоята първа програма на Visual Studio!");
         }*/
    }
}