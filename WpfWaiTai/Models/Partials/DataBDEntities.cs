using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfWaiTai.Models
{
    public partial class DataBDEntities : DbContext
    {
        private static DataBDEntities _context;


        public static DataBDEntities GetContext()
        {
            if (_context == null)
            {
                _context = new DataBDEntities();
            }
            return _context;
        }
    }
}
