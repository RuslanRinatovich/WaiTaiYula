using System;
using System.Collections.Generic;
using System.Data.Entity;
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
using WpfWaiTai.Windows;

namespace WpfWaiTai.Pages
{
    /// <summary>
    /// Логика взаимодействия для RatePage.xaml
    /// </summary>
    public partial class RatePage : Page
    {
        List<PriceList> rates;
        int _itemcount = 0;
        public RatePage()
        {
            InitializeComponent();
            // загрузка данных в combobox + добавление дополнительной строки

        }
        private void ButtonClick(object sender, RoutedEventArgs e)
        {
            // открытие редактирования товара
            // передача выбранного товара в AddRatePage
            // Manager.MainFrame.Navigate(new AddRatePage((sender as Button).DataContext as PriceList));

            try
            {
                // если ни одного объекта не выделено, выходим
                if (DataGridRate.SelectedItem == null) return;
                // получаем выделенный объект
                PriceList selected = (sender as Button).DataContext as PriceList;

                //MessageBox.Show(selected.Service.Name);
                PriceListWindow window = new PriceListWindow(selected);

                if (window.ShowDialog() == true)
                {
                    if (window.currentItem != null)
                    {
                        DataBDEntities.GetContext().Entry(window.currentItem).State = EntityState.Modified;
                        DataBDEntities.GetContext().SaveChanges();
                        UpdateData();
                        MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                }
                else
                {
                    DataBDEntities.GetContext().Entry(window.currentItem).Reload();
                    UpdateData();
                }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }

        }

        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                DataGridRate.ItemsSource = null;
                //загрузка обновленных данных
                var services = DataBDEntities.GetContext().Services.OrderBy(p => p.Title).ToList();
                services.Insert(0, new Service
                {
                    Title = "Все типы"
                }
                );
                ComboService.ItemsSource = services;
                ComboService.SelectedIndex = 0;

                var priceTypes = DataBDEntities.GetContext().PriceTypes.OrderBy(p => p.Title).ToList();
                priceTypes.Insert(0, new PriceType
                {
                    Title = "Все типы"
                }
                );
                ComboZone.ItemsSource = priceTypes;
                ComboZone.SelectedIndex = 0;
                DataBDEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                rates = DataBDEntities.GetContext().PriceLists.OrderBy(p => p.Service.Title).OrderBy(p => p.PriceType.Title).ToList();
                DataGridRate.ItemsSource = rates;
                _itemcount = rates.Count;
                TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
            }
        }

        void LoadData()
        {
            DataBDEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            rates = DataBDEntities.GetContext().PriceLists.Include(p => p.Service).Include(p => p.PriceType).OrderBy(p => p.Service.Title).OrderBy(p => p.PriceType.Title).ToList();
            DataGridRate.ItemsSource = rates;
            _itemcount = rates.Count;
            TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
        }
        // Поиск товаров, которые содержат данную поисковую строку

        // Поиск товаров конкретного производителя
        private void ComboTypeSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }
        /// <summary>
        /// Метод для фильтрации и сортировки данных
        /// </summary>
        private void UpdateData()
        {
            // получаем текущие данные из бд
            var currentRates = DataBDEntities.GetContext().PriceLists.OrderBy(p => p.Service.Title).OrderBy(p => p.PriceType.Title).ToList();
            // выбор только тех товаров, которые принадлежат данному производителю
            if (ComboService.SelectedIndex > 0)
                currentRates = currentRates.Where(p => p.ServiceId == (ComboService.SelectedItem as Service).Id).ToList();
            if (ComboZone.SelectedIndex > 0)
                currentRates = currentRates.Where(p => p.PriceTypeId == (ComboZone.SelectedItem as PriceType).Id).ToList();
            // выбор тех товаров, в названии которых есть поисковая строка
            //   currentRates = currentRates.Where(p => p.RateName.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();

            // сортировка
            if (ComboSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (ComboSort.SelectedIndex == 0)
                    currentRates = currentRates.OrderBy(p => p.Price).ToList();
                // сортировка по убыванию цены
                if (ComboSort.SelectedIndex == 1)
                    currentRates = currentRates.OrderByDescending(p => p.Price).ToList();
            }
            // В качестве источника данных присваиваем список данных
            rates = currentRates;
            DataGridRate.ItemsSource = currentRates;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {currentRates.Count} записей из {_itemcount}";
        }
        // сортировка товаров 
        private void ComboSortSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }
        private void BtnAddClick(object sender, RoutedEventArgs e)
        {
            // открытие  AddRatePage для добавления новой записи
            //Manager.MainFrame.Navigate(new AddRatePage(null));

            try
            {

                PriceListWindow window = new PriceListWindow(new PriceList());
                if (window.ShowDialog() == true)
                {
                    DataBDEntities.GetContext().PriceLists.Add(window.currentItem);
                    DataBDEntities.GetContext().SaveChanges();
                    UpdateData();
                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selectedRates = DataGridRate.SelectedItems.Cast<PriceList>().ToList();
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedRates.Count()} записей???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    // берем из списка удаляемых товаров один элемент
                    PriceList x = selectedRates[0];
                    // проверка, есть ли у товара в таблице о продажах связанные записи
                    // если да, то выбрасывается исключение и удаление прерывается
                    if (x.Orders.Count > 0 )
                        throw new Exception("Есть записи в продажах");

                    // удаляем товара
                    DataBDEntities.GetContext().PriceLists.Remove(x);
                    //сохраняем изменения
                    DataBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    //rates.Clear();
                    //rates = DataBDEntities.GetContext().PriceLists.OrderBy(p => p.Service.Title).OrderBy(p => p.PriceType.Title).ToList();
                    //DataGridRate.ItemsSource = null;
                    //DataGridRate.ItemsSource = rates;
                    UpdateData();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
        private void BtnSellClick(object sender, RoutedEventArgs e)
        {
            // открытие страницы о продажах SellRatesPage
            // передача в него выбранного товара
            // Manager.MainFrame.Navigate(new SellRatesPage((sender as Button).DataContext as PriceList));
        }
        // отображение номеров строк в DataGrid
        private void DataGridRateLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }
        private void BtnEditDev_Click(object sender, RoutedEventArgs e)
        {
            // Manager.MainFrame.Navigate(new DevelopersPage());
        }

        private void PrintExcel()
        {
         
        }


        private void BtnExcel_Click(object sender, RoutedEventArgs e)
        {
            PrintExcel();
        }

        private void ComboZone_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void ComboService_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void BtnEditPriceTypes_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new PriceListTypesPage());
        }
    }
}
