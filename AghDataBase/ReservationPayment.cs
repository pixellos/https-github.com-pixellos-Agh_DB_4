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
    
    public partial class ReservationPayment
    {
        public int Id { get; set; }
        public decimal Amount { get; set; }
        public int ClientId { get; set; }
        public Nullable<int> ConferencePricesId { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual Reservation Reservation { get; set; }
        public virtual ConferencePrices ConferencePrice { get; set; }
    }
}
