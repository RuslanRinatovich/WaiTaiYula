   M S B A M L   `   `   `  ����D  @WpfWaiTai, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:WpfWaiTai.PagesWpfWaiTai.Pages  5      "    WpfWaiTai.Pages.AddOrderPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      X TXceed.Wpf.Toolkit, Version=4.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   
   )localclr-namespace:WpfWaiTai.Pages  5        N� Title$  Записаться��5         MaterialDesignPaper N� 
Background# �   6     MaterialDesignFont N� 
FontFamily# �  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      -   5         ��Name$ PriceTypeRow��5   (   $��44 �6   6(   �� 5      $��40 �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��40 �6   �� 5      $
��Auto �6   �� 5      $��40 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��80 �6    � ColumnDefinitions 5   
   �� 5      .+�5   
   �� -   5         ��Name$ ComboBoxServiceName��5      $��20 5 0 0q�60   $��0��5       $��Stretch=�6#   $��0��5!      $��30��6    $	��0,7q�6,    �� SelectedValuePath$ Id��6:    �� DisplayMemberPath$ Title��6Q   )  #MaterialDesignThemes.Wpf.HintAssist	   Hint$#	 Выберите услугу��5"        MaterialDesignComboBox#���  5#      6E   �� 5$   
   -   5        
 ��Name$
 TbTitle��5$      $,	 &Как к Вам обращаться?��6:   $��20 5 0 0q�6r   $��0��6�   $��Center=�6�   $��3��6�   $��30��6�   $	��0,7q�6�   ��6#   �� *Title+6�   %  Xceed.Wpf.Toolkit.MaskedTextBox  5%   
   -   5          Name$ TbPhone��5%   5      Mask$ +0 (000) 000-00-00��5&        MaterialDesignTextBox#���  6,   $��20 5 0 0q�5'      $��0��6%   $��Center=�65   $��4��6P   $��30��6]   $	��0,7q�6i   ��5%      �� *Phone+5'   i   �� 5(   
   -   5        $
 TbEmail��5(   )   $	 E-mail��6:   $��20 5 0 0q�6c   $��0��6v   $��Center=�6�   $��5��6�   $��30��6�   $	��0,7q�6�   ��6   �� *Email+6�   �� 5*   
   -   5        $ ComboMaster��5*      $��	10 15 0 0q�6)   $%	 Выберите мастера��5+      #���  5,      $��Stretch=�5-      $��6��61   ��5.      �� 5/      .R�50      ��  �� Orientation$ 
Horizontal=�6!   .+�51      �� $��15��6<   $��5 0 5 0q�6G   ��6    �� *
GetPhoto+6G   �� 52      ��6$   �� *Title+53      54      56      �� 58   
   -   5        $ ComboBoxZone��58      $��Center=�6+   $F	 @Выберите продолжительность сеанса��59      $��1��6V   $��1��6c   $ Title��5:      $��10 0 0 0q�6-   $��Stretch=�5;      $ Id��5<      5=      �� 5>   
   -   5         ��Name$ TextBlockPrice��5>       �� Padding$ 20 5 0 0q�6,   $��0��6?   $��Center=�6O   $��2��6k   $��30��6x   $	��0,7q�6�   �� 5?   
   $��7��6   $ 
Horizontal=�6"   $��Center=�6;   .+�5@      (  "System.Windows.Controls.DatePicker  -	   5          Name$ DatePickerDate��5@   %   $	��200��6   $,	 &Выберите дату сеанса��5A       $  MaterialDesignOutlinedDatePicker#��[ 5B         SelectedDate 5A   K   �� *	VisitDate+ �� StringFormat$ d��5B      )  #MaterialDesignThemes.Wpf.TimePicker  5C      -
   5          Name$ TimePickerTime��5C   (   $	��200��6@   $.	 (Выберите время сеанса��5D   $    $  MaterialDesignOutlinedTimePicker#��[ 5E   $      	Is24Hours .    SelectedTime 5D   [   �� *	VisitDate+$ t��5E   ^   �� 5F      -   5        $ TextBlockAnswer��5F      $��Center=�61    " MaterialDesignCaptionTextBlock#���  6L   5G      �� 5H   
   -   5        $
 TbBuy��5H      $'	 !Номер сертификата��68   $��20 5 0 0q�5I      $��80 0 0 0q�6%   $��0��5J      $��Center=�5K      $��8��6.   $��30��6;   $	��200��6G   $
��Left=�6S   ��5H   !   �� *BuyId+5K   n   �� 5L   
   -   5         ��Name$ BtnCheckBuy��5L      $��8��6?   $��60��6L   $
��Left=�6W   $��20 0 0 0q�6r   .��5M      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Check=�6'   $��0q�64   5N      �� 5O   
   -   5        $  TextBlockAnswerSertificate��5O      $��8��68   $	��300��6F   $
��Left=�6R   $��	280 0 0 0q�6m   �� 5P   
   -   5         ��Name$ CheckBoxPayed��5P   2   $��Оплачен��6   $��9��6%   $��20 0 0 0q�6I    d� 	IsChecked 6[   �� *Payed+�� 5Q   
   -   5        $ CheckBoxVisited��5Q   4   $��Завершён��6   $��10��6&   $��20 0 0 0q�6M    6_   �� *	Visited+�� 5R   
   $��Center=�6   $ 
Horizontal=�62   $��11��6K   $��2��6Y   .+�5S      �� -   5        $ BtnOk��5S      $��60��6$   $��5q�62   .��6R   Сохранить6]   �� 5T      -   5        $ BtnToPDF��5T      $��60��6'   $��5q�65   .��6W   PDF6\   5U      $  Xceed.Wpf.Toolkit.DoubleUpDown  5V   
   -   5          Name$ DoubleUpDownBuyPrice��5V      $	 
Сумма��6T   $��20 5 0 0q�5W      $��	600 0 0 0q�6    $��0��5X      �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Double, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Minimum$ 0X�6   $��Center=�5Y      $��8��6)   $��30��66   $	��200��6B   $
��Left=�6N   ,  &Xceed.Wpf.Toolkit.Primitives.InputBase   Text 5V   :   �� *
BuyPrice+5Y   N   5\      5]      