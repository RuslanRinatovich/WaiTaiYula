   M S B A M L   `   `   `  ����D  @WpfWaiTai, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:WpfWaiTai.PagesWpfWaiTai.Pages  5      '    !WpfWaiTai.Pages.CatalogOfServices   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      X TXceed.Wpf.Toolkit, Version=4.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      )localclr-namespace:WpfWaiTai.Pages  5      -   5          N� Title$  WaiTai��5         	base_page#��[  5   0   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   � $��0��6   $��Stretch=�5      .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $G��AВведите название услуги для поиска:��6   �� 5      -   5         ��Name$ 
TBoxSearch��5   &   $	��275��6   5      5      �� 5       $ 
Horizontal=�6   .+�5!      �� $*��$Выберите категорию ��6   $��14(�67    �� Padding$ 3q�6E   $
��Bold"�6Q   �� 5"      -   5         ��Name$ ComboCategory��5"   '   $	��275��6   $��14(�6>   $��3q�6L    �� DisplayMemberPath$ Title��5#   B   5%      �� 5(      $ 
Horizontal=�6   $��3q�62   .+�5)      �� $!��Сортировать по��6   $��Center=�63   $
��Bold"�6N   �� 5+      -   5        $ 	ComboSort��5,      $	��275��5+      $��10 0 0 0q�5-   H   .@�5.      �� .��5/      �� $ 
Horizontal=�6%   .+�50      �� $��Направление��6(   '  !MaterialDesignThemes.Wpf.PackIcon  51         Kind$ SortAscending=�66   $��5 0 0 0q�6K   52      53      �� 54      .��55      �� $ 
Horizontal=�6%   .+�56      �� $��Направление��6(     57      $ SortDescending=�66   $��5 0 0 0q�6L   58      59      5F      5G      5H      �� 5I   
   -   5         ��Name$ 
LViewGoods��5I      $��1��6'   $��Disabled=�5J      ��5L      �� 5M      .R�5N      � 	 � Orientation$	 
Horizontal=�6    $��Center=�69   5O      ��5Q      �� 5R      .R�5S      #  MaterialDesignThemes.Wpf.Card  $	��300��6*   $	��600��66   .��5T      � .  (MaterialDesignThemes.Wpf.ColorZoneAssist
   Mode$
 SecondaryMid=�6    5U      �� 5V   "   $��60 �67   �� 5W   "   $	��150 �67   �� 5X   "   $	��120 �67   �� 5Y   "   $	��200 �67   �� 5Z   "   $��40 �67   .+�5\      �� $��0��6)   $��5q�6;   $��Center=�6G   .+�5^   "   ��  
 akcent#��[ 6H   $
��Wrap=�6m   $��Center=�6�   $
��Bold"�5_   2   $��10q�6D   $��14(�5`   1   ��5^   0   �� *Title+5`   1   5a      �� 5b      $��1��6G   $	��200��6U   $	��260��6c   $��10q�6s   $��Uniform=�5c   %   ��5b   %   ��  �� Path$ GetPhoto�5c   %   �� 5d       ��Name$ BtnMoreInfo��5h   (   -   5         0 ,MaterialDesignFloatingActionMiniAccentButton#��[ 5d   (   $��Right=�5e   (   $��Bottom=�6D   $��0 0 40 0q�6_   $��1��5f   (    � ToolTip$ Подробнее��5g   (   $��2 0 2 0q�5i   (   .��5l   "     $ DotsVertical=�6>   5m      �� 5o      $	��120��5p      $	��300��6)   $��14(�65      MaterialDesignBody1TextBlock#��[ 5q   !   $
��Wrap=�5r      $��Stretch=�5s      $��Stretch=�5u   "   $
 15 5q�6@   $��2��5w   !   ��5v      �� *GetDescription+5w   !   �� 5y      $��Стоимость��6)   $��3��6>   $��16q�6K   $
 SecondaryMid=�6Y   .��5{   &   ��  ��Name$ ListBoxPrices��6/   $	��200��6F   ��6S   �� *
PriceLists+��5|   *   �� 5}   .   .R�5~   2   �� $��5q�6=   $ 
Horizontal=�6H   .+�5   6   �� $��14(�6@   $��20 0 0 0q�6N   $
��Left=�5�   @   $	��150��6[   ��5   `   �� $ PriceType.Title� �� StringFormat$	 {0}��5�   [   �� 5�   6   $��14(�6@   $��Right=�5�   @   $	��120��6\   ��5�   N   �� $ Price�$ c�� �� ConverterCulture$ ru-RU��5�   \   5�   3   5�   /   5�   '   5�      �� 5�      $��5��6/   $ 
Horizontal=�6<   .+�5�   "   �� -   5          MaterialDesignFlatButton#��[ 5�   0   $
��Left=�5�   0   $��8 4 8 8q�5�   0   $��Записаться��5�   0   6E   �� 5�   "   -   5        #��[ 5�   0   $
��Left=�5�   0   $��8 4 8 8q�5�   0   $'��!Купить сертификат��5�   0   6L   5�      5�      5�      5�      5�      �� 5�   
   -	   5         ��Name$ TextBlockCount��5�   !   $��2��6   6!   5�      5�      