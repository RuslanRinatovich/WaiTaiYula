   M S B A M L   `   `   `  ����D  @WpfWaiTai, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:WpfWaiTai.WindowsWpfWaiTai.Windows  5   	   '    !WpfWaiTai.Windows.PriceListWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   X TXceed.Wpf.Toolkit, Version=4.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      +localclr-namespace:WpfWaiTai.Windows  5   	     � Title$  Продажа��5	      $	��260��6   $	��800��6(      base_window_1#��[  64    � WindowStartupLocation$ CenterScreen=�5
   	   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��50 �6    � ColumnDefinitions 5   
   �� 5      $	��187 �6   �� 5      .+�5   
   �� $��Услуга��6   $��Center=�6"   $��0��6=   $��20 0 0 0q�6J   $��0��6]   $��16��6m   �� 5   
   -   5         ��Name$ ComboBoxService��5      $��0��6M   $��1��6Z    �� DisplayMemberPath$ Title��6k    �� SelectedValuePath$ Id��5       �� SelectedItem 5   ,   �� *	Service+5      �� 5   
   $(��"Продолжительность��6   $��Center=�6-   $��1��6H   $��20,5,0,5q�6U   $��0��6h   $��30��6x   �� 5   
   -   5        $ ComboBoxZone��5      $��1��6L   $��1��6Y   $ Title��6j   $ Id��5       5   )   �� *	PriceType+5      $  Xceed.Wpf.Toolkit.DoubleUpDown  5   
   -   5          Name$ UpDownPrice��5      $	��100��62   $
��Left=�5   4   �  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Double, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]	   	Increment$	 1X�5    6   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Double, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]
   Minimum$
 0X�6D   $��2��6P   $��1��6]      Value 5   O   �� *Price+5    ]   �� 5!   
   $��2��6   $��0��6!   $��Стоимость��61   $��20 0 0 0q�6D   $��Center=�6W   �� 5$   
   $��Center=�6    �� Orientation$ 
Horizontal=�62   $��6��6K   $��2��6X   $��127,0,103,0q�6l   $	��162��6�   .+�5%      �� -   5         �� 	IsDefault . $��60��5%   '   $��5q�65   .��6U   OK6Y   �� 5&       �� IsCancel . $��60��6%   $��5q�63   .��6>   Отмена6F   5'      5(      5)      