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
using WpfWaiTai.Windows;

namespace WpfWaiTai
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new CatalogOfServices());
            Manager.MainFrame = MainFrame;
        }

        private void WindowClosed(object sender, EventArgs e)
        {

            App.Current.Shutdown();
        }
        //событие попытки закрытия окна,
        // если пользователь выберет Cancel, то форму не закроем
        private void WindowClosing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            MessageBoxResult x = MessageBox.Show("Вы действительно хотите выйти?",
                "Выйти", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (x == MessageBoxResult.Cancel)
                e.Cancel = true;
        }

        // Кнопка назад
        private void BtnBackClick(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void BtnEditGoodsClick(object sender, RoutedEventArgs e)
        {
        }
        // Событие отрисовки страницы
        // Скрываем или показываем кнопку Назад 
        // Скрываем или показываем кнопки Для перехода к остальным страницам
        private void MainFrameContentRendered(object sender, EventArgs e)
        {
            if (MainFrame.CanGoBack)
            {
                BtnEnter.Visibility = Visibility.Collapsed;
                if (Manager.User != null)
                {
                    BtnBack.Visibility = Visibility.Visible;
                    
                    BtnEditMasters.Visibility = Visibility.Collapsed;
                    BtnEditServices.Visibility = Visibility.Collapsed;
                    BtnEditServices.Visibility = Visibility.Collapsed;
                    BtnOrder.Visibility = Visibility.Collapsed;
                    BtnBuyes.Visibility = Visibility.Collapsed;
                    BtnEditPriceList.Visibility = Visibility.Collapsed;
                    BtnOrder.Visibility = Visibility.Collapsed;
                    BtnBuyes.Visibility = Visibility.Collapsed;
                }

            }
            else
            {
                BtnEnter.Visibility = Visibility.Visible;
                if (Manager.User != null)
                {
                    BtnBack.Visibility = Visibility.Collapsed;
                    BtnEditMasters.Visibility = Visibility.Visible;
                    BtnEditServices.Visibility = Visibility.Visible;

                    BtnEditServices.Visibility = Visibility.Visible;
                    BtnOrder.Visibility = Visibility.Visible;
                    BtnBuyes.Visibility = Visibility.Visible;
                    BtnEditPriceList.Visibility = Visibility.Visible;
                    BtnOrder.Visibility = Visibility.Visible;
                    BtnBuyes.Visibility = Visibility.Visible;
                }
            }
        }

        private void BtnEditDev_Click(object sender, RoutedEventArgs e)
        {
        }

        private void BtnEditGroups_Click(object sender, RoutedEventArgs e)
        {
        }

        private void BtnEnter_Click(object sender, RoutedEventArgs e)
        {
            if (Manager.User != null)
            {
                MessageBoxResult messageBoxResult = MessageBox.Show($"Выйти из системы??? ", "Выход", MessageBoxButton.OKCancel,
MessageBoxImage.Question);
                if (messageBoxResult == MessageBoxResult.OK)
                {
                    IconBtnKey.Kind = MaterialDesignThemes.Wpf.PackIconKind.Login;
                    Manager.User = null;
                    BtnEditMasters.Visibility = Visibility.Collapsed;
                    BtnOrder.Visibility = Visibility.Collapsed;
                    BtnBuyes.Visibility = Visibility.Collapsed;
                    BtnEditServices.Visibility = Visibility.Collapsed;
                    BtnEditPriceList.Visibility = Visibility.Collapsed;
                    return;
                }
            }

            LoginWindow window = new LoginWindow();
            if (window.ShowDialog() == true)
            {

               
                    BtnBack.Visibility = Visibility.Collapsed;
                    BtnEditMasters.Visibility = Visibility.Visible;
                    BtnEditServices.Visibility = Visibility.Visible;
                    BtnOrder.Visibility = Visibility.Visible;
                    BtnBuyes.Visibility = Visibility.Visible;
                    BtnEditPriceList.Visibility = Visibility.Visible;
                    BtnOrder.Visibility = Visibility.Visible;
                    BtnBuyes.Visibility = Visibility.Visible;
               

            }

        }



        private void BtnMyOrder_Click(object sender, RoutedEventArgs e)
        {
            //MainFrame.Navigate(new StatusPage());


        }

       

        private void BtnOrder_Click(object sender, RoutedEventArgs e)
        {

          //  MainFrame.Navigate(new OrderPage());


        }

      

        private void BtnBuyes_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new BuyesPage());
        }

        private void BtnEditMasters_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new MastersPage());

        }

        private void BtnEditPriceTypes_Click(object sender, RoutedEventArgs e)
        {
        
        }

        private void BtnEditCategories_Click(object sender, RoutedEventArgs e)
        {
         
        }

        private void BtnEditServices_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new ServicesPage());
        }

        private void BtnEditPriceList_Click(object sender, RoutedEventArgs e)
        {

            MainFrame.Navigate(new RatePage());
        }

        private void BtnOrder_Click_1(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new OrdersPage());
        }
    }
}
