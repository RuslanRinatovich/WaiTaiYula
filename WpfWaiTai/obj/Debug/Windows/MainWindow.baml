   M S B A M L   `   `   `  ����D  @WpfWaiTai, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:WpfWaiTai	WpfWaiTai  5   	       WpfWaiTai.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   #localclr-namespace:WpfWaiTai  5   	   -   5          � WindowStartupLocation$  CenterScreen=�5
   #      base_window_1#��[  6H    � Title 5	      ��  �� ElementName$ 	MainFrame�� �� Path$ Content.Title�.��5      �  � RowDefinitions 5   
   �� 5      $��75 �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   � �� 5   
     PrimaryHueLightBrush#��[ 6   �� 5   
   $6��0/WpfWaiTai;component/Resources/wt_logo_white.png��6   $��
10,0,0,0.2q�5      $
��Left=�5      $	��125��6+   �� 5   
   $��0��6   $\��VОрганизация по оказанию услуг в сфере здоровья��6!   $��Center=�5      $��	20 0 0 0 q�61   $��Center=�5      
�������$��20(�5      $
��Bold"�5       � 5   
   -   5          �Name$ 	MainFrame��5      $��1��6#     � NavigationUIVisibility$ Hidden=�5      $��1q�5       6$   �� 5!   
   $��0��6    �� Orientation$ 
Horizontal=�6"   $��Right=�6;   $��0 0 20 0q�6W   .+�5"      �� -   5         ��Name$ BtnEditMasters��5"      	 � ToolTip$	 Мастера��6K   $y�	Collapsed=�6]   .��5#      '  !MaterialDesignThemes.Wpf.PackIcon  
   Kind$
 	PeopleAdd=�6+   $��0q�6<   5$      �� 5%      -   5        $ BtnEditServices��5%      $	 Услуги��6M   $y�	Collapsed=�6^   .��5&        $
 ServiceToolbox=�6+   $��0q�6A   5'      �� 5(      -   5        $ BtnEditPriceList��5(      $	 Прайс-лист��6O   $y�	Collapsed=�6d   .��5)        $

 Cash=�6+   $��0q�67   5*      �� 5+      -   5        $ BtnOrder��5+      $	 Заявки��6A   $y�	Collapsed=�6R   .��5,        $
 OrderBoolAscending=�6+   $��0q�6E   5-      �� 5.      -   5        $ BtnBuyes��5.      $y�	Collapsed=�6?   .��5/        $
 Cards=�6+   $��0q�68   50      �� 51      -   5        $ BtnEnter��51      $	 
Войти��6?   .��52        -	   5          Name$ 
IconBtnKey��52   *   $
 Login=�6?   $��0q�6L   53      �� 54      -
   5        $ BtnBack��54      $	 
Назад��55   '   $y�	Collapsed=�67   .��56        $
 	ArrowBack=�6+   $��0q�6<   58      59      �� 5:   
   $��2��6   #��[ 6!   5<      5=      