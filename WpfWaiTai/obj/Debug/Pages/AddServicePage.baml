   M S B A M L   `   `   `  ����D  @WpfWaiTai, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:WpfWaiTai.PagesWpfWaiTai.Pages  5      $    WpfWaiTai.Pages.AddServicePage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      X TXceed.Wpf.Toolkit, Version=4.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      )localclr-namespace:WpfWaiTai.Pages  5        N� Title$:  4Добавление и редактирование��5
         	base_page#��[  5      .��5      �  � RowDefinitions 5   
   �� 5      $	��200 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      $	��245 �6   �� 5      .+�5   
   �� -   5         ��Name$ BtnSave��5      $��4��6"   $��Сохранить��6/   $��Center=�5      $	��Top=�6.   $	��120��6F   $��1��5   &   $��213,3,222,0q�66   �� 5   
   $��0��6   $��0��6"   $��Фото��62   $
��20 0q�6?   �� 5   
   $��1��6   $��0��6!   $+��%Наименование услуги��61   $
��20 0q�6M   �� 5   
   $��3��6   $��0��6!   $,��&Информация об услуге��61   $
��20 0q�6N   �� 5!   
   -   5         ��Name$ 
ImagePhoto��5!      $��0��5"      $��1��6   $��10 0 0 0q�6-   $��Stretch=�5#      $��Stretch=�6,   ��5!   $   �� *
GetPhoto+5#   ,   �� 5$   
   -   5        $ BtnLoad��5$      $��0��6"   $��0��6/   $��	120,5,0,0q�6?   $
��Left=�5%      $	��Top=�6,   $��Загрузить��5&   &   $	��100��6:   �� 5(   
   -   5         ��Name$ TextBoxTitle��5(      $��1��5)      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��5(   (   �� *Title+5)   =   �� 5+   
   $��2��6   $��0��6!   $%��Категория улсуги��61   $
��20 0q�6J   %  Xceed.Wpf.Toolkit.CheckComboBox  5,   
   -   5          Name$ ComboCategories��5,      $��2��67   $��1��6D    �� DisplayMemberPath$ Title��5-   %   +  %Xceed.Wpf.Toolkit.Primitives.Selector   SelectedMemberPath$ Selected��5.      $��34��5/      	   MaxDropDownHeight$		 150Q�6+   �� 53   
   -   5        $ TextBoxProductDescription��53      $��Stretch=�6R   $��Stretch=�54      
 �� TextWrapping$

 Wrap=�60   $	��Top=�55      $��Stretch=�56      $��3��57      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��53   5   �� *Description+57   =   58      59      