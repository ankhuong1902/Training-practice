/// <summary>
/// TableExtension Customer Extension (ID 50100) extends Record MyTargetTable.
/// </summary>

tableextension 50100 "Customer Extension" extends Customer
{
    fields
    {
        // Add changes to table fields here
    }
    var
        myInt: Integer;
    /// <summary>
    /// UpdateCreditLimit.
    /// </summary>
    /// <param name="NewCreditLimit">VAR Decimal.</param>
    internal procedure UpdateCreditLimit(var NewCreditLimit: Decimal; var c: record Customer)
    var
    begin
        NewCreditLimit := Round(NewCreditLimit / 10000) * 10000;
        if (NewCreditLimit >= 0) then
            c.Validate("Credit Limit (LCY)", NewCreditLimit);
        c.SetRange("No.", c."No.");
        if c.FindSet() then
            repeat
                c."Credit Limit (LCY)" := NewCreditLimit;
                c.Modify(true);
            until c.Next() = 0;
        //Message('%1 %2', NewCreditLimit, rec."Credit Limit (LCY)");
    end;

    internal procedure CalculateCreditLimit(var c: record Customer): Decimal;
    var
        //Cust: Record Customer;
        SalesLCY: Decimal;
        "Cust Ledger Entry": Record "Cust. Ledger Entry";
        lDateFrom: Date;
        lDateTo: Date;
    begin
        SalesLCY := 0;
        lDateFrom := 20250115D;
        lDateTo := 20250122D;
        "Cust Ledger Entry".SetRange("Customer No.", c."No.");
        // Message(c."No.");
        //"Cust Ledger Entry".SetRange("Sales (LCY)"", Cust."No.");
        "Cust Ledger Entry".SetRange("Posting Date", lDateFrom, lDateTo);
        If "Cust Ledger Entry".FindSet() then begin
            Repeat
                SalesLCY += "Cust Ledger Entry"."Sales (LCY)";
            until "Cust Ledger Entry".Next() = 0;
        end;
        exit(SalesLCY);
    end;

}