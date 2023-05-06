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
using WpfWaiTai.Pages;
using WpfWaiTai.Models;


namespace WpfWaiTai.Pages
{
    /// <summary>
    /// Логика взаимодействия для ServicesPage.xaml
    /// </summary>
    public partial class ServicesPage : Page
    {
        int _itemcount = 0;
        public ServicesPage()
        {
            InitializeComponent();
            LoadData();
       
        }
        private void ButtonClick(object sender, RoutedEventArgs e)
        {
            // открытие редактирования товара
            // передача выбранного товара в AddGoodPage
            Manager.MainFrame.Navigate(new AddServicePage((sender as Button).DataContext as Service));
        }

        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                LoadData();
            }
        }

        void LoadData()
        {
            var categories = DataBDEntities.GetContext().Categories.OrderBy(p => p.Title).ToList();
            categories.Insert(0, new Category
            {
                Title = "Все типы"
            }
            );
            ComboCategory.ItemsSource = categories;
            ComboCategory.SelectedIndex = 0;

            DataGridData.ItemsSource = null;
            //загрузка обновленных данных
            DataBDEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            List<Service> data = DataBDEntities.GetContext().Services.OrderBy(p => p.Title).ToList();
            DataGridData.ItemsSource = data;

            TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
            _itemcount = data.Count;
        }

        private void BtnAddClick(object sender, RoutedEventArgs e)
        {
            // открытие  AddGoodPage для добавления новой записи
            Manager.MainFrame.Navigate(new AddServicePage(null));
        }

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selected = DataGridData.SelectedItems.Cast<Service>().ToList();
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selected.Count()} записей???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    // берем из списка удаляемых товаров один элемент
                    Service x = selected[0];
                    // проверка, есть ли у товара в таблице о продажах связанные записи
                    // если да, то выбрасывается исключение и удаление прерывается
                    if (x.ServiceCategories.Count > 0 || x.PriceLists.Count > 0)
                        throw new Exception("Ошибка удаления, есть связанные записи");

                    DataBDEntities.GetContext().Services.Remove(x);
                    //сохраняем изменения
                    DataBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    List<Service> goods = DataBDEntities.GetContext().Services.OrderBy(p => p.Title).ToList();
                    DataGridData.ItemsSource = null;
                    DataGridData.ItemsSource = goods;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        // отображение номеров строк в DataGrid
        private void DataGridDataLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }

        // Поиск товаров, которые содержат данную поисковую строку
        private void TBoxSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }
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
            //var currentGoods = DataBDEntities.GetContext().Abonements.OrderBy(p => p.CategoryTrainer.Trainer.LastName).ToList();

            var currentData = DataBDEntities.GetContext().Services.OrderBy(p => p.Title).ToList();
            // выбор только тех товаров, которые принадлежат данному производителю

            if (ComboCategory.SelectedIndex > 0)
            {
                int catId = Convert.ToInt32((ComboCategory.SelectedItem as Category).Id);
                List<Service> services = new List<Service>();
                foreach (Service service in currentData)
                {
                    List<ServiceCategory> serviceCategories = service.ServiceCategories.ToList();

                    if (serviceCategories.Any(elem => elem.CategoryId == catId))
                        services.Add(service);
                }

                currentData = services;
            }


            // выбор тех товаров, в названии которых есть поисковая строка
            currentData = currentData.Where(p => p.Title.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();


            if (ComboSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (ComboSort.SelectedIndex == 0)
                    currentData = currentData.OrderBy(p => p.Title).ToList();
                if (ComboSort.SelectedIndex == 1)
                    currentData = currentData.OrderByDescending(p => p.Title).ToList();
                // сортировка по убыванию цены
            }
            // В качестве источника данных присваиваем список данных
            DataGridData.ItemsSource = currentData;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {currentData.Count} записей из {_itemcount}";
        }
        // сортировка товаров 
        private void ComboSortSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void DataGridData_LoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }

        private void BtnEditCategories_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new CategoryPage());
        }

        private void BtnSells_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new SellsPage((sender as Button).DataContext as Service));
        }
    }
}


