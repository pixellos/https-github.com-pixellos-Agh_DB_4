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
    
    public partial class WorkshopReservationPayment
    {
        public int Id { get; set; }
        public decimal Amount { get; set; }
    
        public virtual WorkshopReservation WorkshopReservation { get; set; }
    }
}
