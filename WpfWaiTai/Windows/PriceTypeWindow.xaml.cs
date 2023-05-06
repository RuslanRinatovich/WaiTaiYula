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
    /// Логика взаимодействия для PriceTypeWindow.xaml
    /// </summary>
    public partial class PriceTypeWindow : Window
    {
        public PriceType currentItem { get; private set; }


        public PriceTypeWindow(PriceType p)
        {
            InitializeComponent();
            currentItem = p;

    


            DataContext = currentItem;
        }


        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (UpDownMinutes.Value is null)
                s.AppendLine("Укажите длительность занятий");
            if (TbName.Text =="")
                s.AppendLine("Укажите название");
         
            return s;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            currentItem.Minutes = Convert.ToInt32(UpDownMinutes.Value);

            currentItem.Title = TbName.Text;
            this.DialogResult = true;
        }


    }
}
