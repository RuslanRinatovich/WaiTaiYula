using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfWaiTai.Models
{
 public partial class Master
    {
        public string GetPhoto
        {
            get
            {
                if (Photo is null)
                    return null;
                return System.IO.Directory.GetCurrentDirectory() + @"\Images\" + Photo.Trim();
            }
        }

    }
}