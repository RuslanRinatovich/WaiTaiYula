   M S B A M L   `   `   `  ����D  @WpfWaiTai, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:WpfWaiTai.PagesWpfWaiTai.Pages  5          WpfWaiTai.Pages.RatePage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      )localclr-namespace:WpfWaiTai.Pages  5      -   5          N� Title$  Тарифы��5
         	base_page#��[  6?   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��40 �6   .+�5   
   � $��0��6   $��	0 20 0 0 q�6"   $��Stretch=�5        PrimaryHueLightBrush#��[ 5      .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $#��Выберите услугу��6   �� 5      -   5         ��Name$ ComboService��5   '   $	��275��6    �� DisplayMemberPath$ Title��5      5      �� 5      $ 
Horizontal=�6   .+�5      �� $F��@Выберите продолжительность услуги��6   �� 5      -   5        $ 	ComboZone��5   '   $	��275��6   $ Title��5!      5"      �� 5#      $ 
Horizontal=�6   .+�5$      �� $!��Сортировать по��6   �� 5&      -   5        $ 	ComboSort��5'      $	��275��5&      .@�5)      �� $!��По возрастанию��6#   �� 5*      $��По убыванию��6#   5+      5,      5-      &   System.Windows.Controls.DataGrid  5.   
   -   5          Name$ DataGridRate��5.      $��1��6)      AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=�51      	   Columns	 53      0  *System.Windows.Controls.DataGridTextColumn  55      ,  &System.Windows.Controls.DataGridColumn
   Header$	
 №��6<      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6G   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *Id+6G     56      $
 Стоимость��6k   $ * 6~    6%   �� *Price+ �� StringFormat$ c�� �� ConverterCulture$ ru-RU��6~     57      $
 Услуга��6G   $ * 6W    6%   �� *Service.Title+6W     58      $(
 "Продолжительность��6I   $ * 6d    6%   �� *PriceType.Title+6d   4  .System.Windows.Controls.DataGridTemplateColumn  59      $
 auto 6)   $ 
 Редактировать��66      CellTemplate 5:      �� 5;      .R�5<      ��  ��Name$ BtnEdit��6%   -   5        $	��...��5<   6   $��0q�6X   5=      5?      5C      �� 5D   
   -   5        $ BtnAdd��5D      $��2��6!   $	��100��6.   $��Right=�6:   $��	3 0 120 0q�6V   $��Добавить��5E      6$   �� 5F   
   -   5        $ 	BtnDelete��5F      $��2��6$   $	��100��61   $��Right=�6=   $��3q�6Y   $��Удалить��5G      6#   �� 5H   
   -	   5        $ BtnEditPriceTypes��5H       � ToolTip$3 -Продолжительности услуг��5I      $��2��5J      $	��100��6   $��Right=�6*   $��	3 0 240 0q�6F   .��5K      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Dollar=�6'   $��0q�65   5L      �� 5M   
   -
   5         ��Name$ TextBlockCount��5M   !   $��2��6   $	��300��69   $
��Left=�6E   5N      5O      