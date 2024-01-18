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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PachaWPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private const string _version = "0.01";
        private ViewModel.Main _vm;

        public MainWindow()
        {
            InitializeComponent();
            this.Title = "Pachdata Manager v." + _version;
            _vm = new ViewModel.Main();
            DataContext = _vm;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //dgContacts.ItemsSource = _vm.SearchContact(searchBox.Text);
            dgContacts.ItemsSource = _vm.SearchContactWithEnrollmentsBad(searchBox.Text);
        }
    }

}
