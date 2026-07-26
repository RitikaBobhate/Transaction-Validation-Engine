pageextension 90101 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Allow Partial Shipment"; Rec."Allow Partial Shipment")
            {
                ApplicationArea = All;
                Caption = 'Allow Partial Shipment';
                ToolTip = 'Specifies whether partial shipment is allowed for this customer.';
            }
        }
    }
}