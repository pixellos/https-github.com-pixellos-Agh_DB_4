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
    
    public partial class Conference
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Conference()
        {
            this.ConferencePrices = new HashSet<ConferencePrices>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public System.TimeSpan Date { get; set; }
        public int BuildingId { get; set; }
        public int WorkshopPriceId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ConferencePrices> ConferencePrices { get; set; }
        public virtual Building Building { get; set; }
        public virtual WorkshopPrice WorkshopPrice { get; set; }
    }
}
