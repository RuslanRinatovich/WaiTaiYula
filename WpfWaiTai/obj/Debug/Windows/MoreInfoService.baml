   M S B A M L   `   `   `  ����  	WpfWaiTai'    !WpfWaiTai.Windows.MoreInfoService   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	     � Title$  Подробнее��5   	   $	��700��6   $	��800��6(    � WindowStartupLocation$ CenterScreen=�64   $	��700��6Y   $	��700��6i   .��5      �  � RowDefinitions 5      �� 5      $
��Auto �6$   �� 5      $	��200 �6$   �� 5      $	��140 �6$   �� 5      $
��auto �6    �� 5      �� 5      .+�5      �� $
��Bold"�6    �� TextAlignment$ Center=�5      $
��Wrap=�60   $��0��6D   $��3q�6Q   $��18(�6\   ��5   +   �� *Title+5   \   �� 5      $��1��6:   $��Uniform=�6J   ��6   ��  �� Path$ GetPhoto�6J   �� 5      $
��Bold"�6   $ Center=�6L   $
��Wrap=�5      $��2��61   $��3q�6>   $��18(�6I   ��5   /   �� *Description+5   I   �� 5      $��Стоимость��6   $
��Wrap=�6.   $��3��6B   $��0��6O   $��2��6_   $
��Bold"�6s   �� 5      -   5         ��Name$ ListBoxTimeTable��5      $��4��66   ��6D   �� *
PriceLists+��5      �� 5      .R�5      �� $��5q�6)    �� Orientation$ 
Horizontal=�64   .+�5    "   �� $��14(�6,   $��20 0 0 0q�6:   $
��Left=�6�   $	��150��6�   ��6L   �� $ PriceType.Title� �� StringFormat$	 {0}��6�   �� 5!   "   $��14(�6,   $��Right=�6�   $	��120��6�   ��6:   �� $ Price�$ c�� �� ConverterCulture$ ru-RU��6�   5#      5$      5&      �� 5'      -   5        	 ��Name$	 btnOk��5'      $��5��6$   .��5(      �� $ 
Horizontal=�6   $��Center=�66   .+�5)      '  !MaterialDesignThemes.Wpf.PackIcon  
   Kind$
 Check=�6.   ���#FFF$��5q�6M   $��Center=�6X   �� 5*      $��Записаться��6    $��Center=�62   5+      5,      5-      53      