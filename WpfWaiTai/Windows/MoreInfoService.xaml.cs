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
using WpfWaiTai.Models;

namespace WpfWaiTai.Windows
{
    /// <summary>
    /// Логика взаимодействия для MoreInfoService.xaml
    /// </summary>
    public partial class MoreInfoService : Window
    {
        Service current;
        public MoreInfoService(Service service)
        {
            InitializeComponent();
            current = service;
            DataContext = service;
        }

        private void BtnOk_Click(object sender, RoutedEventArgs e)
        {
            
            AddNewOrderWindow addNewOrderWindow = new AddNewOrderWindow(current);
            addNewOrderWindow.ShowDialog();
        }
    }
}
