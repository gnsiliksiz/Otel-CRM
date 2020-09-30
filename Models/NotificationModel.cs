using System;

namespace Otel.Models
{
    public class NotificationModel
    {
        public string BildirimTur { get; set; }

        public string Bildirimİcerik { get; set; }
        
        public bool BildirimDurum { get; set; }

        public Nullable<System.DateTime> BildirimDate { get; set; }

       
    }
}