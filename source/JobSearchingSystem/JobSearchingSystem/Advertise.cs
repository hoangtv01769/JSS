//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JobSearchingSystem
{
    using System;
    using System.Collections.Generic;
    
    public partial class Advertise
    {
        public Advertise()
        {
            this.PurchaseAdvertises = new HashSet<PurchaseAdvertise>();
        }
    
        public int AdvertiseID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Position { get; set; }
        public decimal Cost { get; set; }
    
        public virtual ICollection<PurchaseAdvertise> PurchaseAdvertises { get; set; }
    }
}
