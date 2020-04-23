using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace StudentInfoSystem
{
    class RelayCommand : ICommand
    {
        private readonly Action _action;
        private Action<MainWindow> loadStudentData;

        public RelayCommand(Action action)
        {
            this._action = action;
        }

        public RelayCommand(Action<MainWindow> loadStudentData)
        {
            this.loadStudentData = loadStudentData;
        }

        public event EventHandler CanExecuteChanged { add { } remove { } }

        public bool CanExecute(object parameter)
        {
            return true;
        }

        public void Execute(object parameter)
        {
            _action();
        }

        
    }
}
