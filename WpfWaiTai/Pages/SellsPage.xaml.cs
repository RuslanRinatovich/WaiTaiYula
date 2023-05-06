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
using WpfWaiTai.Models;

namespace WpfWaiTai.Pages
{
    /// <summary>
    /// Логика взаимодействия для SellsPage.xaml
    /// </summary>
    public partial class SellsPage : Page
    {
        public SellsPage(Service service)
        {
            InitializeComponent();
            LoadData(service);

        }
        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }


        // загрузка данных в DataGrid и ComboBox
        void LoadData(Service service)
        {
            DtData.ItemsSource = DataBDEntities.GetContext().Orders.Where(p => p.PriceList.ServiceId == service.Id).ToList();
            ComboGoods.ItemsSource = DataBDEntities.GetContext().Services.OrderBy(p => p.Title).ToList(); ;
            ComboGoods.SelectedIndex = 0;
            ComboGoods.SelectedValue = service.Id;
        }
        // фильтрация продаж по товару
        private void ComboGoodsSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboGoods.SelectedIndex >= 0)
            {
                int serviceId = Convert.ToInt32(ComboGoods.SelectedValue);
                var x = DtData.ItemsSource = DataBDEntities.GetContext().Orders.Where(p => p.PriceList.ServiceId == serviceId).ToList();
                DtData.ItemsSource = x;
            }
        }



    }
}