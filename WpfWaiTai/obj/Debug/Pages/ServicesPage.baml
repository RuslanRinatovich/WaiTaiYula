   M S B A M L   `   `   `  ����D  @WpfWaiTai, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:WpfWaiTai.PagesWpfWaiTai.Pages  5      "    WpfWaiTai.Pages.ServicesPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   
   )localclr-namespace:WpfWaiTai.Pages  5      -   5          N� Title$  Услуги��5
   	      	base_page#���   6@   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $
��auto �6   .+�5   
   � $��0��6   $��Stretch=�5      .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $G��AВведите название услуги для поиска:��6   �� 5      -   5         ��Name$ 
TBoxSearch��5   &   $	��275��6   5      5      �� 5      $ 
Horizontal=�6   .+�5      �� $*��$Выберите категорию ��6   $��14(�67    �� Padding$ 3q�6E   $
��Bold"�6Q   �� 5       -   5         ��Name$ ComboCategory��5    '   $	��275��6   $��14(�6>   $��3q�6L    �� DisplayMemberPath$ Title��5!   B   5#      �� 5&      $ 
Horizontal=�6   $��3q�62   .+�5'      �� $!��Сортировать по��6   $��Center=�63   $
��Bold"�6N   �� 5)      -   5        $ 	ComboSort��5*      $	��275��5)      $��10 0 0 0q�5+   H   .@�5,      �� .��5-      �� $ 
Horizontal=�6%   .+�5.      �� $��Направление��6(   '  !MaterialDesignThemes.Wpf.PackIcon  5/         Kind$ SortAscending=�66   $��5 0 0 0q�6K   50      51      �� 52      .��53      �� $ 
Horizontal=�6%   .+�54      �� $��Направление��6(     55      $ SortDescending=�66   $��5 0 0 0q�6L   56      57      59      5:      5;      &   System.Windows.Controls.DataGrid  5>   
   -   5          Name$ DataGridData��5>      $��1��6)   	   AutoGenerateColumns	 .  
   
IsReadOnly
 .    SelectionMode$ Single=�5B         Columns 5C      0  *System.Windows.Controls.DataGridTextColumn  5D      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6<      Width5  /System.Windows.Controls.DataGridLengthConverter$ 30 6H   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *Id+6H   4  .System.Windows.Controls.DataGridTemplateColumn  5E      $	 100 6)   $ Фото��65      CellTemplate 5F      �� 5G      .R�5H      �� ��6$   ��  �� Path$ GetPhoto�5I      5K        5L      $ Наименование��6?   $ * 6U    6%   �� *Title+6U     5M      $, &Информация об услуге��6H   $ * 6f    6%   �� *GetDescription+6f     5N      $
 auto 6)   $  Редактировать��66    5O      �� 5P      .R�5Q      ��  ��Name$ BtnEdit��6%   -   5        $	��...��5Q   6   $��0q�6X   5R      5T        5U      $
 auto 6)   $ Продажи��66    5V      �� 5W      .R�5X      �� $ BtnSells��6%   -   5        $	��...��5X   7   $��0q�6\   5Y      5[      5]      �� 5^   
   -   5        $ BtnAdd��5^      $��2��6!   $	��100��6.   $��Right=�6:   $��	3 0 120 0q�6V   $��Добавить��5_      6$   �� 5`   
   -	   5        $ 	BtnDelete��5`      $��2��6$   $	��100��61   $��Right=�6=   $��3q�6Y   $��Удалить��5a      6#   �� 5b   
   -
   5        $ BtnEditCategories��5b       � ToolTip$ Виды услуг��6M   $��2��6b   $	��100��6o   $��Right=�6{   $��	3 0 240 0q�6�   .��5c        $ AppsBox=�6'   $��0q�66   5d      �� 5e   
   -   5         ��Name$ TextBlockCount��5e   !   $��2��6   $
��Left=�69   $	��300��6T   5f      5g      