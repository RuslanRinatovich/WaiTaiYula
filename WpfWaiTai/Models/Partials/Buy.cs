using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfWaiTai.Models
{
    public partial class Buy
    {
        public bool IsExpired
        {
            get
            {

                return GetLeftMoney <= 0;
            }
        }

        public double GetLeftMoney
            
            {
            get {
                double s = 0;
                foreach (Order order in Orders)
                {
                    s += Convert.ToDouble(order.BuyPrice);
                }
                return Price - s;
            }
        }

    }
}
