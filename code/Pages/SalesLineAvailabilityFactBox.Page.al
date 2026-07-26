page 90103 "Sales Availability FactBox"
{
    PageType = CardPart;
    SourceTable = "Sales Line";
    Caption = 'Item Availability';

    layout
    {
        area(content)
        {
            field(OrderedQty; Rec.Quantity)
            {
                ApplicationArea = All;
                Caption = 'Ordered Quantity';
                Editable = false;
            }

            field(AvailableInventory; AvailableQty)
            {
                ApplicationArea = All;
                Caption = 'Available Inventory';
                Editable = false;
            }

            field(RemainingQty; RemainingQty)
            {
                ApplicationArea = All;
                Caption = 'Remaining Quantity';
                Editable = false;
                StyleExpr = RemainingStyleExpr;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        Item: Record Item;
    begin
        AvailableQty := 0;
        RemainingQty := Rec.Quantity;

        if (Rec.Type = Rec.Type::Item) and Item.Get(Rec."No.") then begin
            Item.CalcFields(Inventory);
            AvailableQty := Item.Inventory;
        end;

        RemainingQty := Rec.Quantity - AvailableQty;

        if RemainingQty > 0 then
            RemainingStyleExpr := 'Unfavorable'
        else
            RemainingStyleExpr := 'Favorable';
    end;

    var
        AvailableQty: Decimal;
        RemainingQty: Decimal;
        RemainingStyleExpr: Text;
}