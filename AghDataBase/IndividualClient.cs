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
    
    public partial class IndividualClient
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public IndividualClient()
        {
            this.ConferenceDays = new HashSet<ConferenceDay>();
            this.WorkshopReservations = new HashSet<WorkshopReservation>();
        }
    
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PersonalNumber { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual CorporateClientEmploye CorporateClientEmploye { get; set; }
        public virtual Student Student { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ConferenceDay> ConferenceDays { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WorkshopReservation> WorkshopReservations { get; set; }
    }
}
