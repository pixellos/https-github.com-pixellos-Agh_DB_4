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
    
    public partial class CorporateClientEmploye
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public Nullable<int> CorporateClientId { get; set; }
    
        public virtual IndividualClient IndividualClients { get; set; }
        public virtual CorporateClient CorporateClient { get; set; }
    }
}
