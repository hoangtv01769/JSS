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
    
    public partial class DesiredBenefit
    {
        public int BenefitID { get; set; }
        public string JobSeekerID { get; set; }
        public bool IsDeleted { get; set; }
    
        public virtual Benefit Benefit { get; set; }
        public virtual Jobseeker Jobseeker { get; set; }
    }
}
