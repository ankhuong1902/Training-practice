/// <summary>
/// Codeunit CodeunitTest (ID 50102).
/// </summary>
codeunit 50102 CodeunitTest
{
    trigger OnRun()
    begin
    end;

    internal procedure CalculateCreditLimit(var Cust: Record Customer): Decimal;
    var
        //Cust: Record Customer;
        SalesLCY: Decimal;
        "Cust Ledger Entry": Record "Cust. Ledger Entry";
        lDateFrom: Date;
        lDateTo: Date;
    begin
        SalesLCY := 0;
        lDateFrom := 20250115D;
        lDateTo := 20250120D;
        "Cust Ledger Entry".SetRange("Customer No.", Cust."No.");
        //"Cust Ledger Entry".SetRange("Sales (LCY)"", Cust."No.");
        "Cust Ledger Entry".SetRange("Posting Date", lDateFrom, lDateTo);
        If "Cust Ledger Entry".FindSet() then begin
            Repeat
                SalesLCY += "Cust Ledger Entry"."Sales (LCY)";
            until "Cust Ledger Entry".Next() = 0;
        end;
        exit(SalesLCY);
    end;

    internal procedure UpdateCreditLimit(var NewCreditLimit: Decimal)
    begin

    end;

    var
        myInt: Integer;
}