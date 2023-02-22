using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BillSystem.Classes
{
    public class Itemfetch
    { 
         public string ItemCode { get; set; }
         public string ItemName { get; set; }
         public string GST { get; set; }
         public string Price { get; set; }
         public string priwithgst { get; set; }
         public string GST2 { get; set; }
         public string QTY { get; set; }
         public string Discount { get; set; }
        public string TotalGST { get; set; }
        public string TotalwithGSTandDiscount { get; set; }

        public string Customer { get; set; }
    }
}