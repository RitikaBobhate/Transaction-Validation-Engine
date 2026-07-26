pageextension 90102 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addlast(FactBoxes)
        {
            part(SalesLineAvailabilityFactBox; "Sales Availability FactBox")
            {
                ApplicationArea = All;
                Caption = 'Item Availability';

                SubPageLink =
                    "Document Type" = FIELD("Document Type"),
                    "Document No." = FIELD("No.");
            }
        }
    }
}