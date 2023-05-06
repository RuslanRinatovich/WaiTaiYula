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
using Word = Microsoft.Office.Interop.Word;
using Microsoft.Win32;

namespace WpfWaiTai.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddOrderPage.xaml
    /// </summary>
    public partial class AddOrderPage : Page
    {
        Service current = new Service();
        PriceList currentPriceList = new PriceList();
        Order _currentOrder = new Order();
        Buy _currentBuy = new Buy();
        double ?_currentBuyPrice = null;
        int sertificateId = -1;
        bool IsValidBuy;

        public AddOrderPage(Order order)
        {
            InitializeComponent();

            _currentOrder = order;
            DataContext = order;
           


            ComboBoxServiceName.ItemsSource = DataBDEntities.GetContext().Services.OrderBy(p => p.Title).ToList();
            PriceTypeRow.Height = new GridLength(0);

            var masters = DataBDEntities.GetContext().Masters.OrderBy(p => p.Title).ToList();
            ComboMaster.ItemsSource = masters;
            ComboMaster.SelectedIndex = 0;
            if (order != null)
            {
                ComboBoxServiceName.SelectedItem = order.PriceList.Service;
                current = order.PriceList.Service;
                
               
                if (order.BuyId != null)
                {
                        _currentBuyPrice = order.BuyPrice;
                        _currentBuy = DataBDEntities.GetContext().Buys.FirstOrDefault(p => p.Id == _currentOrder.BuyId);
                        TbBuy.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(0, 255, 0));

                        TextBlockAnswerSertificate.Text = "Сертификат принят. Лимит по сертификату " + (_currentBuy.LeftTotal + Convert.ToDouble(_currentOrder.BuyPrice)).ToString("c"); ;
                        TextBlockAnswerSertificate.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(0, 255, 0));
                        sertificateId = _currentBuy.Id;

                        DoubleUpDownBuyPrice.Maximum = Math.Min(Convert.ToDouble(_currentBuy.LeftTotal) + Convert.ToDouble(order.BuyPrice), currentPriceList.Price);
                    return;
                    
                }
                //PriceTypeRow.Height = new GridLength(44);
                //List<PriceList> priceLists = DataBDEntities.GetContext().PriceLists.Where(p => p.ServiceId == current.Id).ToList();

                //List<PriceType> priceTypes = new List<PriceType>();
                //foreach (PriceList priceList in priceLists)
                //{
                //    priceTypes.Add(priceList.PriceType);
                //}
                //priceTypes = priceTypes.OrderBy(p => p.Title).ToList();
                //ComboBoxZone.ItemsSource = priceTypes;
                //ComboBoxZone.Text = order.PriceList.PriceType.Title;
            }
            

        }

        static bool IsValidMailAddress(string mail)
        {
            try
            {
                System.Net.Mail.MailAddress mailAddress = new System.Net.Mail.MailAddress(mail);

                return true;
            }
            catch
            {
                return false;
            }
        }


        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (string.IsNullOrWhiteSpace(TbTitle.Text))
                s.AppendLine("Поле имя пустое");
            if (!TbPhone.IsMaskFull)
                s.AppendLine("Укажите телефон");
            if (string.IsNullOrWhiteSpace(TbEmail.Text))
                s.AppendLine("Укажите email");
            if (!IsValidMailAddress(TbEmail.Text))
                s.AppendLine("Укажите корректный email");

            if (ComboBoxZone.SelectedIndex == -1)
                s.AppendLine("Не выбрана продолжительность сеанса");
            if (ComboMaster.SelectedIndex == -1)
                s.AppendLine("Не выбрана мастер");
            if (DatePickerDate.SelectedDate == null)
                s.AppendLine("Выберите дату");
            if (TimePickerTime.SelectedTime == null)
                s.AppendLine("Выберите время");
            if (sertificateId != -1 && DoubleUpDownBuyPrice.Value is null)
                s.AppendLine("Укажите сумму списания");

            //if (sertificateId != -1 && DoubleUpDownBuyPrice.Value != null)
            //{
            //    Buy buy = DataBDEntities.GetContext().Buys.FirstOrDefault(p => p.Id == sertificateId);
            //    if (buy.GetLeftMoney < DoubleUpDownBuyPrice.Value)
            //        s.AppendLine("На сертификате осталось " + buy.GetLeftMoney.ToString("c"));
            //}  
            //if (!CheckDateAndTime())
            //    s.AppendLine("Укажите корректные дату и время");
            return s;
        }
        private void ComboBoxZone_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboBoxZone.SelectedIndex == -1)
                return;
            int pricetypeid = Convert.ToInt32(ComboBoxZone.SelectedValue);
            PriceType priceType = (ComboBoxZone.SelectedItem) as PriceType;
            //MessageBox.Show(priceType.Title);
            //double price = DataBDEntities.GetContext().PriceLists.Single(p => p.PriceTypeId == pricetypeid && p.ServiceId == current.Id).Price;
            currentPriceList = DataBDEntities.GetContext().PriceLists.FirstOrDefault(p => p.PriceTypeId == pricetypeid && p.ServiceId == current.Id);
            TextBlockPrice.Text = currentPriceList.Price.ToString("c");


        }

        

        bool CheckDateAndTime()
        {


            int day = DatePickerDate.SelectedDate.Value.Date.Day;
            int month = DatePickerDate.SelectedDate.Value.Date.Month;
            int year = DatePickerDate.SelectedDate.Value.Date.Year;

            int hours = TimePickerTime.SelectedTime.Value.Hour;
            int minutes = TimePickerTime.SelectedTime.Value.Minute;
            int seconds = TimePickerTime.SelectedTime.Value.Second;
            DateTime date = new DateTime(year, month, day, hours, minutes, seconds);
            if (hours < 8 && hours > 20)
                return false;
            Order order = DataBDEntities.GetContext().Orders.FirstOrDefault(p => p.VisitDate == date);
            if (!(order is null))
                return true;

            return false;
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

            if (_currentOrder is null)
                _currentOrder = new Order();
            _currentOrder.Phone = TbPhone.Text;
            _currentOrder.Email = TbEmail.Text;
            _currentOrder.OrderDate = DateTime.Now;
            _currentOrder.PriceListId = currentPriceList.Id;
            _currentOrder.Title = TbTitle.Text;
            _currentOrder.MasterId = ((ComboMaster.SelectedItem) as Master).Id;
            _currentOrder.Payed = Convert.ToBoolean(CheckBoxPayed.IsChecked);
            _currentOrder.Visited = Convert.ToBoolean(CheckBoxVisited.IsChecked);

            if (sertificateId != -1)
            {
               
                Buy buy = DataBDEntities.GetContext().Buys.Find(sertificateId);

                if (_currentOrder != null) // заявка есть
                {
                    if (_currentBuy != null) // есть сертификат
                    {
                        if (_currentBuy == buy) // сертификат не поменялся
                        {

                            double x = buy.LeftTotal + Convert.ToDouble(_currentBuyPrice);
                            double y = Convert.ToDouble(DoubleUpDownBuyPrice.Value);
                            buy.LeftTotal = x - y;
                            MessageBox.Show("+" + buy.LeftTotal.ToString("c"));
                            //DataBDEntities.GetContext().SaveChanges();
                            _currentBuy = buy;
                            _currentOrder.BuyId = sertificateId;
                            _currentOrder.BuyPrice = Convert.ToDouble(DoubleUpDownBuyPrice.Value);
                            MessageBox.Show("+");
                        }
                        else
                        {
                            _currentBuy.LeftTotal = _currentBuy.LeftTotal + Convert.ToDouble(_currentBuyPrice);
                            _currentOrder.BuyId = sertificateId;
                            _currentOrder.BuyPrice = Convert.ToDouble(DoubleUpDownBuyPrice.Value);
                            buy.LeftTotal = Convert.ToDouble(buy.LeftTotal) - Convert.ToDouble(_currentOrder.BuyPrice);
                            DataBDEntities.GetContext().SaveChanges();
                            _currentBuy = buy;
                            MessageBox.Show("-");
                        }

                        _currentBuyPrice = _currentOrder.BuyPrice;
                    }
                    else
                    {
                        _currentOrder.BuyId = null;
                        _currentOrder.BuyPrice = null;
                        _currentBuyPrice = null;
                    }

                }
                else
                {
                    _currentOrder.BuyId = sertificateId;
                    _currentOrder.BuyPrice = Convert.ToDouble(DoubleUpDownBuyPrice.Value);
                    buy.LeftTotal = Convert.ToDouble(buy.LeftTotal) - Convert.ToDouble(_currentOrder.BuyPrice);
                    DataBDEntities.GetContext().SaveChanges();
                    _currentBuy = buy;
                    MessageBox.Show("*");
                }
                
            }
            else
            {

                if (_currentOrder != null && _currentOrder.Buy != null)  // заявка есть
                {
                    _currentOrder.Buy.LeftTotal = _currentBuy.LeftTotal + Convert.ToDouble(_currentBuyPrice);
                    _currentOrder.BuyId = null;
                    _currentOrder.BuyPrice = null;
                    DataBDEntities.GetContext().SaveChanges();
                }

            }

            int day = DatePickerDate.SelectedDate.Value.Date.Day;
            int month = DatePickerDate.SelectedDate.Value.Date.Month;
            int year = DatePickerDate.SelectedDate.Value.Date.Year;

            int hours = TimePickerTime.SelectedTime.Value.Hour;
            int minutes = TimePickerTime.SelectedTime.Value.Minute;
            int seconds = TimePickerTime.SelectedTime.Value.Second;
            DateTime date = new DateTime(year, month, day, hours, minutes, seconds);
            _currentOrder.VisitDate = date;

            try
            {
                if (_currentOrder.Id == 0)
                {
                   

                    DataBDEntities.GetContext().Orders.Add(_currentOrder);
                    DataBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Запись создана");
                }
                else
                {
                    DataBDEntities.GetContext().SaveChanges();
                    MessageBox.Show("Запись Изменена");
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }

        }


        private void BtnSavePDF_Click(object sender, RoutedEventArgs e)
        {
            PrintInPdf(_currentOrder);
        }

        void PrintInPdf(Order order)
        {
            try
            {
                string path = null;
                // указываем файл для сохранения
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.Filter = "PDF (.pdf)|*.pdf"; // Filter files by extension
                                                            // если диалог завершился успешно
                if (saveFileDialog.ShowDialog() == true)
                {
                    path = saveFileDialog.FileName;
                    Word.Application application = new Word.Application();
                    Word.Document document = application.Documents.Add();
                    Word.Paragraph paragraph = document.Paragraphs.Add();
                    Word.Range range = paragraph.Range;
                    range.Font.Bold = 1;
                    range.Text = $"Номер заказа: {order.Id}";
                    range.InsertParagraphAfter();



                    range = paragraph.Range;
                    range.Font.Bold = 0;
                    range.Text = $"Дата создания записи: {order.OrderDate}\n" +
                        $"Уважаемый, {order.Title}, телефон:{order.Phone}\temail:{order.Email}\n" +
                        $"Вы записаны на: {order.VisitDate}\n" +
                        $"К мастеру: {order.Master.Title}\n" +
                        $"на сеанс: {order.PriceList.Service.Title}\n" +
                        $"продолжительность сеанса: {order.PriceList.PriceType.Title}\n" +
                        $"\nОбщая стоимость: {order.PriceList.Price:f2} руб.";


                    range.InsertParagraphAfter();


                    document.SaveAs2($@"{path}", Word.WdExportFormat.wdExportFormatPDF);
                    MessageBox.Show("Данные записаны в PDF-файл");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void BtnToPDF_Click(object sender, RoutedEventArgs e)
        {
            PrintInPdf(_currentOrder);
        }

        private void ComboBoxServiceName_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboBoxServiceName.SelectedIndex == -1)
                PriceTypeRow.Height = new GridLength(0);
            else
            {
                ComboBoxZone.ItemsSource = null;
                PriceTypeRow.Height = new GridLength(44);

                current = (ComboBoxServiceName.SelectedItem) as Service;
                List<PriceList> priceLists = DataBDEntities.GetContext().PriceLists.Where(p => p.ServiceId == current.Id).ToList();

                List<PriceType> priceTypes = new List<PriceType>();
                foreach (PriceList priceList in priceLists)
                {
                    priceTypes.Add(priceList.PriceType);
                }
                priceTypes = priceTypes.OrderBy(p => p.Title).ToList();
                ComboBoxZone.ItemsSource = priceTypes;
                if (_currentOrder != null)
                    ComboBoxZone.SelectedItem = _currentOrder.PriceList.PriceType;
            }
            //// MessageBox.Show("+++");
            //if (_currentOrder != null)
            //{
            //    ComboBoxZone.SelectedItem = _currentOrder.PriceList.PriceType;
            //}
        }

        private void BtnBuyes_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                //получил сертификат по указанному номеру
                int ser = Convert.ToInt32(TbBuy.Text);
                Buy buy = DataBDEntities.GetContext().Buys.FirstOrDefault(p => p.Id == ser);
                // не верный номер сертификата
                if (buy is null)
                {
                    TbBuy.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(255, 0, 0));
                    TextBlockAnswerSertificate.Text = "Сертификат не принят, неверный номер ";
                    TextBlockAnswerSertificate.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(255, 0, 0));
                    sertificateId = -1;
                    return;
                }
                // сертификат тот же что и прописан
                // 

                ////if (_currentOrder != null) // заявка есть
                ////{
                ////    if (_currentBuy != null) // есть сертификат
                ////    {
                ////        if (_currentBuy == buy) // сертификат не поменялся
                ////        {
                            
                ////        }
                ////    }

                ////}



                    if (buy.LeftTotal <= 0 && _currentBuy != buy)
                    {
                        TbBuy.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(255, 0, 0));
                        TextBlockAnswerSertificate.Text = "Лимит сертификата исчерпан";
                        TextBlockAnswerSertificate.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(255, 0, 0));
                        sertificateId = -1;
                        return;
                    }

                if (_currentBuy == buy)
                {
                    TbBuy.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(0, 255, 0));
                    TextBlockAnswerSertificate.Text = "Сертификат принят. Лимит по сертификату " + (_currentBuy.LeftTotal
                        + Convert.ToDouble(_currentOrder.BuyPrice)).ToString("c"); ;
                    TextBlockAnswerSertificate.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(0, 255, 0));
                    sertificateId = _currentBuy.Id;
                    return;
                }
                if (buy != null && buy.LeftTotal > 0)
                {
                    TbBuy.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(0, 255, 0));
                    TextBlockAnswerSertificate.Text = "Сертификат принят. Лимит по сертификату " + buy.LeftTotal.ToString("c");
                    TextBlockAnswerSertificate.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(0, 255, 0));

                    if (ComboBoxZone.SelectedIndex == -1 || current == null)
                        return;
                    int pricetypeid = Convert.ToInt32(ComboBoxZone.SelectedValue);
                    PriceType priceType = (ComboBoxZone.SelectedItem) as PriceType;
                    //MessageBox.Show(priceType.Title);
                    //double price = DataBDEntities.GetContext().PriceLists.Single(p => p.PriceTypeId == pricetypeid && p.ServiceId == current.Id).Price;
                    currentPriceList = DataBDEntities.GetContext().PriceLists.FirstOrDefault(p => p.PriceTypeId == pricetypeid && p.ServiceId == current.Id);
                    
                   
                    DoubleUpDownBuyPrice.Maximum = Math.Min(buy.LeftTotal, currentPriceList.Price);
                    sertificateId = ser;
                }


                ////if (_currentOrder.BuyId != null && buy != null)
                ////{
                ////    if (_currentOrder.BuyId == buy.Id)
                ////    {
                ////        TbBuy.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(0, 255, 0));
                ////        TextBlockAnswerSertificate.Text = "Сертификат принят. Лимит по сертификату " + (buy.GetLeftMoney + _currentOrder.PriceList.Price).ToString("c");
                ////        TextBlockAnswerSertificate.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(0, 255, 0));
                ////        sertificateId = ser;
                ////        return;
                ////    }
                ////}

                //if (buy != null && !buy.IsExpired)
                //{
                //    TbBuy.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(0, 255, 0));
                //    TextBlockAnswerSertificate.Text = "Сертификат принят. Лимит по сертификату " + buy.GetLeftMoney.ToString("c");
                //    TextBlockAnswerSertificate.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(0, 255, 0));
                //    sertificateId = ser;
                //}
                //else
                //{
                //    TbBuy.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(255, 0, 0));
                //    TextBlockAnswerSertificate.Text = "Сертификат не принят, неверный номер ";
                //    TextBlockAnswerSertificate.Foreground = new System.Windows.Media.SolidColorBrush(Color.FromRgb(255, 0, 0));
                //    sertificateId = -1;
                //}
            }
            catch (FormatException ex)
            {
                MessageBox.Show("Ошибка данных");
            }
            //catch (Exception ex)
            //{
            //    MessageBox.Show("Ошибка");
            //}

        }

        private void TbBuy_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (TbBuy.Text == "")
            {
                DoubleUpDownBuyPrice.Visibility = Visibility.Collapsed;
                sertificateId = -1;

            }
            try
            {
                int x = int.Parse(TbBuy.Text);
                DoubleUpDownBuyPrice.Visibility = Visibility.Visible;
                int ser = Convert.ToInt32(TbBuy.Text);
                Buy buy = DataBDEntities.GetContext().Buys.FirstOrDefault(p => p.Id == ser);
                if (buy != null)
                {
                    sertificateId = buy.Id;
                    DoubleUpDownBuyPrice.Visibility = Visibility.Visible;
                }
                else
                {
                    sertificateId = -1;
                    DoubleUpDownBuyPrice.Visibility = Visibility.Collapsed;
                }

            }
            catch (FormatException ex)
            {
                //MessageBox.Show("Некорректный номер сертификата");
                DoubleUpDownBuyPrice.Visibility = Visibility.Collapsed;
                DoubleUpDownBuyPrice.Value = 0;
            }
            
        }
    }
}
