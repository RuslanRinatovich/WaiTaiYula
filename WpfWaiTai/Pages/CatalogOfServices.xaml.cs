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
using WpfWaiTai.Windows;

namespace WpfWaiTai.Pages
{
    /// <summary>
    /// Логика взаимодействия для CatalogOfServices.xaml
    /// </summary>
    public partial class CatalogOfServices : Page
    {
        int _itemcount = 0;



        public CatalogOfServices()
        {
            InitializeComponent();
            // загрузка данных в combobox + добавление дополнительной строки
            //var trainers = DataBDEntities.GetContext().Masters.OrderBy(p => p.Title).ToList();
            //trainers.Insert(0, new Master
            //{
            //    Title = "Все"
            //}
            //);
            //ComboTrainer.ItemsSource = trainers;
            //ComboTrainer.SelectedIndex = 0;

            var categories = DataBDEntities.GetContext().Categories.OrderBy(p => p.Title).ToList();
            categories.Insert(0, new Category
            {
                Title = "Все типы"
            }
            );
            ComboCategory.ItemsSource = categories;
            ComboCategory.SelectedIndex = 0;
            // загрузка данных в listview сортируем по названию

            LViewGoods.ItemsSource = DataBDEntities.GetContext().Services.OrderBy(p => p.Title).ToList();
            _itemcount = LViewGoods.Items.Count;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
        }

        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //обновление данных после каждой активации окна
            if (Visibility == Visibility.Visible)
            {
             

                var categories = DataBDEntities.GetContext().Categories.OrderBy(p => p.Title).ToList();
                categories.Insert(0, new Category
                {
                    Title = "Все типы"
                }
                );
                ComboCategory.ItemsSource = categories;
                ComboCategory.SelectedIndex = 0;
                // загрузка данных в listview сортируем по названию

                LViewGoods.ItemsSource = DataBDEntities.GetContext().Services.OrderBy(p => p.Title).ToList();
                _itemcount = LViewGoods.Items.Count;

            }
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
            LViewGoods.ItemsSource = currentData;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {currentData.Count} записей из {_itemcount}";
        }
        // сортировка товаров 
        private void ComboSortSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void BtnShowMore_Click(object sender, RoutedEventArgs e)
        {
            //     Service selected = (sender as Button).DataContext as Service;

            //  MessageBox.Show(selected.PriceLists.Count.ToString());
        }

        private void ComboTrainer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void BtnMoreInfo_Click(object sender, RoutedEventArgs e)
        {
            Service service = (sender as Button).DataContext as Service;
            MoreInfoService window = new MoreInfoService(service);
            window.ShowDialog();
            //Trainer trainer = DataBDEntities.GetContext().Trainers.FirstOrDefault(p => p.Id == edu.TrainerId);
            //List<TimeTable> timeTables = DataBDEntities.GetContext().TimeTables.Where(p => p.CategoryTrainerId == edu.Id).ToList();
            //ListBoxTimeTable.ItemsSource = timeTables;
            //TbCategoryName.Text = edu.Category.Name;
            //DialogHostMoreInformation.DataContext = service;
            //DialogHostMoreInformation.IsOpen = true;
        }

        private void BtnOk_Click(object sender, RoutedEventArgs e)
        {
           // DialogHostMoreInformation.IsOpen = false;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Service service = (sender as Button).DataContext as Service;
            AddNewOrderWindow addNewOrderWindow = new AddNewOrderWindow(service);
            addNewOrderWindow.ShowDialog();

        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            BuySertificateWindow buySertificateWindow = new BuySertificateWindow();
            buySertificateWindow.ShowDialog();

        }
    }
}
