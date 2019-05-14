//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AghDataBase
{
    using System;
    using System.Collections.Generic;
    
    public partial class Workshop
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Workshop()
        {
            this.WorkshopReservations = new HashSet<WorkshopReservation>();
        }
    
        public int Id { get; set; }
        public System.DateTime StartTime { get; set; }
        public System.DateTime EndTime { get; set; }
        public string Name { get; set; }
        public int ConferenceDayId { get; set; }
    
        public virtual ConferenceDay ConferenceDay { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WorkshopReservation> WorkshopReservations { get; set; }
        public virtual WorkshopPrice WorkshopPrice { get; set; }
    }
}
