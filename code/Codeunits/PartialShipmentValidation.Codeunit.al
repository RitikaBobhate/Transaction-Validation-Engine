codeunit 90104 "Partial Shipment Validation"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
        SalesLine: Record "Sales Line";
        Item: Record Item;
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            exit;

        if not Customer.Get(SalesHeader."Sell-to Customer No.") then
            exit;

        if Customer."Allow Partial Shipment" then
            exit;

        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Outstanding Quantity", '>0');

        if SalesLine.FindSet() then
            repeat
                if Item.Get(SalesLine."No.") then begin
                    Item.CalcFields(Inventory);
                    if Item.Inventory < SalesLine."Outstanding Quantity" then
                        Error('Partial shipment is not allowed for Customer %1.', Customer.Name);
                end;
            until SalesLine.Next() = 0;
    end;
}