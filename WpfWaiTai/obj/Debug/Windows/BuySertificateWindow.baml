   M S B A M L   `   `   `  ����D  @WpfWaiTai, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:WpfWaiTai.WindowsWpfWaiTai.Windows  5   	   ,    &WpfWaiTai.Windows.BuySertificateWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   X TXceed.Wpf.Toolkit, Version=4.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5   
   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   
   +localclr-namespace:WpfWaiTai.Windows  5   	     � Title$'  !Купить сертификат��5
   
      MaterialDesignPaper#���   6%   $	��600��6X   $	��300��6d    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$ 
ToolWindow=�6.     MaterialDesignFont#���  5   	   .��5      �  � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��40 �6   �� 5      $
��Auto �6    � ColumnDefinitions 5   
   �� 5      .+�5   
   �� -   5         ��Name$ TextBlockBuyDate��5       �� Padding$ 20 5 0 0q�6.   $��0��6A   $��Stretch=�6Q   $��0��6n   $��30��6{   $	��0,7q�6�      MaterialDesignBody1TextBlock#���  5      �� 5   
   -   5         ��Name$ TbTitle��5      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$, &Как к Вам обращаться?��6:   $��20 5 0 0q�6r   $��0��6�   $��Center=�6�   $��1��6�   $��30��6�   $	��0,7q�6�   ��6#   �� *Title+6�   %  Xceed.Wpf.Toolkit.MaskedTextBox  5   
   -   5        	  Name$	 TbPhone��5   5   
   Mask$
 +0 (000) 000-00-00��5        MaterialDesignTextBox#���  6,   $��20 5 0 0q�5      $��0��6%   $��Center=�65   $��2��6P   $��30��6]   $	��0,7q�6i   ��5      �� *Phone+5   i   �� 5   
   -   5        $ TbEmail��5   )   $ E-mail��6:   $��20 5 0 0q�6c   $��0��6v   $��Center=�6�   $��3��6�   $��30��6�   $	��0,7q�6�   ��6   �� *Email+6�   �� 5#   
   $��4��6   $	��100��6!   $
��Left=�6-   $ 15 0 0 0q�6H   $��Стоимость��5$      $��Center=�6%     MaterialDesignTextBlock#���  6@   �� 5%      -   5         ��Name$ SliderPrice��5'      $��4��5%      $��	100 0 0 0q�6"    � Value$
 1000Q�5&   	    � Minimum$ 0Q�5(   	    � Maximum$ 10000Q�5)   	      MaterialDesignDiscreteSlider#��[ 5*   	    � ToolTip$) #Размер сертификата��5+   	    �� TickFrequency$
 1000Q�5,   	    �� TickPlacement$ BottomRight=�5-   	   $ Стоимость��5.      �� 5/   
   $��Center=�6    �� Orientation$ 
Horizontal=�62   $��5��6K   $��2��6X   .+�50      �� -   5         ��Name$ BtnOk��50       �� 	IsDefault . $��60��65   $��5q�6C   .��6c   OK6g   �� 51      -   5        $ 	BtnCancel��51       �� IsCancel . $��60��68   $��5q�6F   .��6Q   Отмена6Y   �� 52      -   5        $ BtnToPDF��52      $��60��6'   $��5q�65   $y�	Collapsed=�6@   .��6n   Сохранить в PDF6   53      56      57      