/// <summary>
/// Codeunit UpdateCO (ID 50101).
/// </summary>
codeunit 50101 UpdateCO
{
    trigger OnRun()
    begin
        UpdatelCustomerOverview();
    end;

    local procedure UpdatelCustomerOverview()
    begin
        lCustomer.Reset();
        lCustomer.FindSet();
        repeat
            // Step a: Get data from GL/Entry table
            lGlEntry.SETRANGE("Source Type", lGlEntry."Source Type"::Customer);
            lGlEntry.SETRANGE("Source Code", 'SALES');
            lGlEntry.SETRANGE("Source No.", lCustomer."No.");
            IF lGlEntry.FindSet() then begin
                repeat
                    // Step b: Insert the data into the lCustomerOverview table
                    lCustomerOverview.Init();
                    lCustomerOverview."Entry No." := lCustomerOverview."Entry No." + 1;
                    lCustomerOverview."Customer No." := lCustomer."No.";
                    lCustomerOverview."Customer Name" := lCustomer."Name";
                    lCustomerOverview."Source Code" := "lSource Code".Code;
                    lCustomerOverview."Customer Name" := lCustomer."Name";
                    lCustomerOverview."Amount" := lGlEntry."Amount";
                    lCustomerOverview."LastRunDate" := CurrentDateTime;
                    lCustomerOverview.Insert(true);

                until lGlEntry.NEXT = 0;
            end;
        until lCustomer.Next = 0;

        Message('ok');

    end;

    var
        lGlEntry: Record "G/L Entry";
        lCustomerOverview: Record "CustomerOverview";
        lCustomer: Record Customer;
        "lSource Code": Record "Source Code";



    var
        myInt: Integer;

}