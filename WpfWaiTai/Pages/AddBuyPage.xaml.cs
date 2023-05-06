using Microsoft.Win32;
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



namespace WpfWaiTai.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddBuyPage.xaml
    /// </summary>
    public partial class AddBuyPage : Page
    {
        Buy _current = new Buy();
        public AddBuyPage(Buy buy)
        {
            InitializeComponent();
            _current = buy;
            DataContext = buy;
            TextBlockBuyDate.Text = DateTime.Today.ToShortDateString();

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
            //if (UpDownPrice.Value is null)
            //    s.AppendLine("Укажите стоимость сертификата");
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

            Buy buy = new Buy();
            buy.Phone = TbPhone.Text;
            buy.BuyDate = DateTime.Now;
            buy.Email = TbEmail.Text;
            buy.Title = TbTitle.Text;
            buy.LeftTotal = Convert.ToInt32(SliderPrice.Value);
            buy.Price = Convert.ToInt32(SliderPrice.Value);

            try
            {
                DataBDEntities.GetContext().Buys.Add(buy);
                _current = buy;
                DataBDEntities.GetContext().SaveChanges();
                MessageBox.Show("Сертификат оформлен");
                BtnToPDF.Visibility = Visibility.Visible;
                BtnOk.Visibility = Visibility.Collapsed;
                TbPhone.IsEnabled = false;
                TbEmail.IsEnabled = false;
                TbTitle.IsEnabled = false;
                SliderPrice.IsEnabled = false;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }


        }


        private void BtnSavePDF_Click(object sender, RoutedEventArgs e)
        {
            PrintInPdf(_current);
        }

        void PrintInPdf(Buy order)
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
                    range.Text = $"Номер сертификата: {order.Id}";
                    range.InsertParagraphAfter();



                    range = paragraph.Range;
                    range.Font.Bold = 0;
                    range.Text = $"Дата создания записи: {order.BuyDate}\n" +
                        $"Уважаемый, {order.Title}, телефон:{order.Phone}\temail:{order.Email}\n" +
                        $"Вы оформили сертификат на сумму: {order.Price:f2} руб.";


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
            PrintInPdf(_current);
        }
    }
}