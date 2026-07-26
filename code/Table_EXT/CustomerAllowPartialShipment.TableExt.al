tableextension 90100 CustAllowPartShipExt extends Customer
{
    fields
    {
        field(90100; "Allow Partial Shipment"; Boolean)
        {
            Caption = 'Allow Partial Shipment';
            DataClassification = CustomerContent;
        }
    }
}