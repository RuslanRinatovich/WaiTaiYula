using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using WpfWaiTai.Models;
using WpfWaiTai.Windows;

namespace WpfWaiTai.Pages
{
    /// <summary>
    /// Логика взаимодействия для PriceListTypesPage.xaml
    /// </summary>
    public partial class PriceListTypesPage : Page
    {
        List<PriceType> priceTypes;
        public PriceListTypesPage()
        {
            InitializeComponent();
        }


        void LoadData()
        {
            try
            {
                DtData.ItemsSource = null;
                //загрузка обновленных данных
                DataBDEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                priceTypes = DataBDEntities.GetContext().PriceTypes.OrderBy(p => p.Title).ToList();
                DtData.ItemsSource = priceTypes;
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                LoadData();
            }
        }

        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }


        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{


                PriceTypeWindow window = new PriceTypeWindow(new PriceType());
                if (window.ShowDialog() == true)
                {
                    DataBDEntities.GetContext().PriceTypes.Add(window.currentItem);
                    DataBDEntities.GetContext().SaveChanges();
                    LoadData();
                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            //}
            //catch
            //{
            //    MessageBox.Show("Ошибка");
            //}
        }

        private void btnChange_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{
                // если ни одного объекта не выделено, выходим
                if (DtData.SelectedItem == null) return;
                // получаем выделенный объект
                PriceType selected = DtData.SelectedItem as PriceType;

                PriceTypeWindow window = new PriceTypeWindow(selected);


                if (window.ShowDialog() == true)
                {
                    if (window.currentItem != null)
                    {
                        DataBDEntities.GetContext().Entry(window.currentItem).State = EntityState.Modified;
                        DataBDEntities.GetContext().SaveChanges();
                        LoadData();
                        MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                }
                else
                {
                    DataBDEntities.GetContext().Entry(window.currentItem).Reload();
                    LoadData();
                }
            //}
            //catch
            //{
            //    MessageBox.Show("Ошибка");
            //}

        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // если ни одного объекта не выделено, выходим
                if (DtData.SelectedItem == null) return;
                // получаем выделенный объект
                MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись? ", "Удаление", MessageBoxButton.OKCancel,
MessageBoxImage.Question);
                if (messageBoxResult == MessageBoxResult.OK)
                {
                    PriceType deletedItem = DtData.SelectedItem as PriceType;





                    if (deletedItem.PriceLists.Count > 0)
                    {
                        MessageBox.Show("Ошибка удаления, есть связанные записи", "Error",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    DataBDEntities.GetContext().PriceTypes.Remove(deletedItem);
                    DataBDEntities.GetContext().SaveChanges();
                    LoadData();
                    MessageBox.Show("Запись удалена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка, есть связанные записи");
            }
            finally
            {
                LoadData();
            }
        }
    }
}
