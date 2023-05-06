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
    /// Логика взаимодействия для PriceListWindow.xaml
    /// </summary>
    public partial class PriceListWindow : Window
    {
        public PriceList currentItem { get; private set; }


        public PriceListWindow(PriceList p)
        {
            InitializeComponent();
            currentItem = p;


            List<Service> services = DataBDEntities.GetContext().Services.OrderBy(x => x.Title).ToList();

            ComboBoxService.ItemsSource = services;

            List<PriceType> zones = DataBDEntities.GetContext().PriceTypes.OrderBy(x => x.Title).ToList();
            ComboBoxZone.ItemsSource = zones;



            DataContext = currentItem;
        }


        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (UpDownPrice.Value is null)
                s.AppendLine("Цена не указана");
            if (ComboBoxService.SelectedIndex == -1)
                s.AppendLine("Не выбрана услуга");
            if (ComboBoxZone.SelectedIndex == -1)
                s.AppendLine("Не выбрана продолжительность");
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
            currentItem.Price = Convert.ToInt32(UpDownPrice.Value);

            currentItem.ServiceId = Convert.ToInt32(ComboBoxService.SelectedValue);
            currentItem.PriceTypeId = Convert.ToInt32(ComboBoxZone.SelectedValue);
            this.DialogResult = true;
        }


    }
}
