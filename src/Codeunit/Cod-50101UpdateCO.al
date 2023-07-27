/// <summary>
/// Codeunit UpdateCO (ID 50101).
/// </summary>
codeunit 50101 UpdateCO
{
    trigger OnRun()
    begin
        UpdateCustomerOverview();
    end;

    local PROCEDURE UpdateCustomerOverview()
    BEGIN
        Customer.Reset();
        Customer.FindSet();
        repeat
            // Step a: Get data from GL/Entry table
            GLEntry.SETRANGE("Source Type", GLEntry."Source Type"::Customer);
            GLEntry.SETRANGE("Source Code", 'SALES');
            GLEntry.SETRANGE("Source No.", Customer."No.");
            IF GLEntry.FindSet() THEN BEGIN
                REPEAT
                    // Step b: Insert the data into the CustomerOverview table
                    CustomerOverview.Init();
                    CustomerOverview."Entry No." := CustomerOverview."Entry No." + 1;
                    CustomerOverview."Customer No." := Customer."No.";
                    CustomerOverview."Customer Name" := Customer."Name";
                    CustomerOverview."Source Code" := "Source Code".Code;
                    CustomerOverview."Customer Name" := Customer."Name";
                    CustomerOverview."Amount" := GLEntry."Amount";
                    CustomerOverview."LastRunDate" := CURRENTDATETIME;
                    CustomerOverview.INSERT(TRUE);

                UNTIL GLEntry.NEXT = 0;
            END;
        until Customer.Next = 0;

        Message('ok');

    END;

    VAR
        GLEntry: Record "G/L Entry";
        CustomerOverview: Record "CustomerOverview";
        Customer: Record Customer;
        "Source Code": Record "Source Code";



    var
        myInt: Integer;

}