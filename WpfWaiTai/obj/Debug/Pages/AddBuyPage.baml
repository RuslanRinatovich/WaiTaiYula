   M S B A M L   `   `   `  ����D  @WpfWaiTai, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:WpfWaiTai.PagesWpfWaiTai.Pages  5           WpfWaiTai.Pages.AddBuyPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      X TXceed.Wpf.Toolkit, Version=4.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   )localclr-namespace:WpfWaiTai.Pages  5        N� Title$'  !Купить сертификат��5         MaterialDesignPaper N� 
Background# �   6#     MaterialDesignFont N� 
FontFamily# �  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��40 �6   �� 5      $
��Auto �6    � ColumnDefinitions 5   
   �� 5      .+�5   
   �� -   5         ��Name$ TextBlockBuyDate��5       �� Padding$ 20 5 0 0q�6.   $��0��6A   $��Stretch=�5      $��0��61   $��30��6>   $	��0,7q�6J      MaterialDesignBody1TextBlock#���  5      �� 5   
   -   5         ��Name$ TbTitle��5      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$, &Как к Вам обращаться?��5      $��20 5 0 0q�5      $��0��6%   $��Center=�65   $��1��6Q   $��30��6^   $	��0,7q�6j   ��5   #   �� *Title+5   j   %  Xceed.Wpf.Toolkit.MaskedTextBox  5   
   -   5        	  Name$	 TbPhone��5   5   
   Mask$
 +0 (000) 000-00-00��5         MaterialDesignTextBox#���  6,   $��20 5 0 0q�5!      $��0��6%   $��Center=�65   $��2��6P   $��30��6]   $	��0,7q�6i   ��5      �� *Phone+5!   i   �� 5"   
   -   5        $ TbEmail��5"   )   $ E-mail��6:   $��20 5 0 0q�6c   $��0��6v   $��Center=�6�   $��3��6�   $��30��6�   $	��0,7q�6�   ��6   �� *Email+6�   �� 5&   
   $��4��6   $	��100��6!   $
��Left=�6-   $ 15 0 0 0q�6H   $��Стоимость��5'      $��Center=�6%     MaterialDesignTextBlock#���  6@   �� 5(   
   -   5         ��Name$ SliderPrice��5*      $��4��5(      $��	100 0 0 0q�6    � Value$
 1000Q�5)   	    � Minimum$ 0Q�5+   	    � Maximum$ 10000Q�5,   	      MaterialDesignDiscreteSlider#��[ 5-   	    � ToolTip$) #Размер сертификата��5.   	    �� TickFrequency$
 1000Q�5/   	    �� TickPlacement$ BottomRight=�50   	   $ Стоимость��51      �� 52   
   $��Center=�6    �� Orientation$ 
Horizontal=�62   $��11��6K   $��2��6Y   .+�53      �� -   5         ��Name$ BtnOk��53      $��60��6$   $��5q�62   .��6R   Сохранить6]   �� 54      -   5        $ BtnToPDF��54      $��60��6'   $��5q�65   $y�	Collapsed=�6W   .��6n   PDF6s   55      58      59      