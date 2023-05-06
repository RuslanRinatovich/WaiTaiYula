using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfWaiTai.Models
{
    public partial class Service
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

        public string GetTypes
        {
            get
            {
                List<ServiceCategory> serviceTypes = ServiceCategories.ToList();
                string result = "";
                foreach (ServiceCategory item in serviceTypes)
                {
                    if (result == "")
                        result += $"{item.Category.Title}";
                    else
                        result += $", {item.Category.Title}";
                }
                return result;

            }
        }

        public string GetDescription
        {
            get
            {

                int len = Description.Length;
                if (len > 200)
                    return  Description.Substring(0, 200) + "...";
                return Description + "...";
            }
        }
    }
}


