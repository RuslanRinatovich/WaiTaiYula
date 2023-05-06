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
using System.Net.Mail;
using System.Net;
using Word = Microsoft.Office.Interop.Word;
using Microsoft.Win32;

namespace WpfWaiTai.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddNewOrderWindow.xaml
    /// </summary>
    public partial class AddNewOrderWindow : Window
    {
        Service current = new Service();
        PriceList currentPriceList = new PriceList();
        Order _currentOrder = new Order();
        bool IsValidBuy;
        public AddNewOrderWindow(Service service)
        {
            InitializeComponent();

            current = service;
            TextBlockServiceName.Text = current.Title;
            List<PriceList> priceLists = DataBDEntities.GetContext().PriceLists.Where(p =>  p.ServiceId == current.Id).ToList();

            List<PriceType> priceTypes = new List<PriceType>();
            foreach (PriceList priceList in priceLists)
            {
                priceTypes.Add(priceList.PriceType);
            }
            priceTypes = priceTypes.OrderBy(p => p.Title).ToList();
            ComboBoxZone.ItemsSource = priceTypes;
            var masters = DataBDEntities.GetContext().Masters.OrderBy(p => p.Title).ToList();
            ComboMaster.ItemsSource = masters;
            ComboMaster.SelectedIndex = 0;

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

            Order order = new Order();
            order.Phone = TbPhone.Text;
            order.Email = TbEmail.Text;
            order.OrderDate = DateTime.Now;
            order.PriceListId = currentPriceList.Id;
            order.Title = TbTitle.Text;
            order.MasterId = ((ComboMaster.SelectedItem) as Master).Id;
            order.Payed = false;
            order.Visited = false;

            int day = DatePickerDate.SelectedDate.Value.Date.Day;
            int month = DatePickerDate.SelectedDate.Value.Date.Month;
            int year = DatePickerDate.SelectedDate.Value.Date.Year;

            int hours = TimePickerTime.SelectedTime.Value.Hour;
            int minutes = TimePickerTime.SelectedTime.Value.Minute;
            int seconds = TimePickerTime.SelectedTime.Value.Second;
            DateTime date = new DateTime(year, month, day, hours, minutes, seconds);
            order.VisitDate = date;
            try
            {
                DataBDEntities.GetContext().Orders.Add(order);
                _currentOrder = order;
                DataBDEntities.GetContext().SaveChanges();
                MessageBox.Show("Вы записаны на сеанс");
                BtnToPDF.Visibility = Visibility.Visible;
                BtnOk.Visibility = Visibility.Collapsed;
                BtnCancel.Visibility = Visibility.Collapsed;
                TbPhone.IsEnabled = false;
                TbEmail.IsEnabled = false;
                TbTitle.IsEnabled = false;
                ComboBoxZone.IsEnabled = false;
                ComboMaster.IsEnabled = false;
                DatePickerDate.IsEnabled = false;
                TimePickerTime.IsEnabled = false;
        
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
                        $"Вы записаны на: {order.VisitDate}\n"+
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

        
    }
}
