   M S B A M L   `   `   `  ����D  @WpfWaiTai, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:WpfWaiTai.PagesWpfWaiTai.Pages  5      #    WpfWaiTai.Pages.AddMasterPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      X TXceed.Wpf.Toolkit, Version=4.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      )localclr-namespace:WpfWaiTai.Pages  5        N� Title$:  4Добавление и редактирование��5
   	      	base_page#��[  5      .��5      �  � RowDefinitions 5   
   �� 5      $	��200 �6   �� 5      $
��auto �6   �� 5      �� 5      $��40 �6    � ColumnDefinitions 5   
   �� 5      $	��245 �6   �� 5      .+�5   
   �� -   5         ��Name$ BtnSave��5      $��3��6"   $��Сохранить��6/   $��Center=�5      $	��Top=�6.   $	��120��6F   $��1��5   &   $��213,3,222,0q�66   �� 5   
   $��0��6   $��0��6"   $��Фото��62   $
��20 0q�6?   �� 5   
   $��1��6   $��0��6!   $��Имя��61   $
��20 0q�6=   �� 5   
   $��2��6   $��0��6!   $,��&Информация о мастере��61   $
��20 0q�6N   �� 5    
   -   5         ��Name$ 
ImagePhoto��5       $��0��5!      $��1��6   $��10 0 0 0q�6-   $��Stretch=�5"      $
��Left=�6,   $	��100��6G   ��5    $   �� *
GetPhoto+5"   G   �� 5#   
   -   5        $ BtnLoad��5#      $��0��6"   $��0��6/   $��	120,5,0,0q�6?   $
��Left=�5$      $	��Top=�6,   $��Загрузить��5%   &   $��79��6:   �� 5&   
   -   5         ��Name$ TextBoxTitle��5&      $��1��5'      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��5&   (   �� *Title+5'   =   �� 5(   
   -   5        $ TextBoxProductDescription��5(      $��Stretch=�6K   $��Stretch=�5)       �� TextWrapping$
 Wrap=�60   $	��Top=�5*      $��Stretch=�5+      $��2��5,      $��1��6   $	��0,2q�6/   $
��Auto��6=   ��5(   5   �� *Info+5,   =   5-      5.      