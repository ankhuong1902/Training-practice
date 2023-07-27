/// <summary>
/// PageExtension Customer Card Extension (ID 50101) extends Record Customer Card.
/// </summary>
pageextension 50101 "Customer Card Extension" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast("F&unctions")
        {
            action(UpdateCreditLimit)
            {
                Caption = 'Update Credit Limit';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    CallUpdateCreditLimit();
                end;
            }
            // action(TestProcedure)
            // {
            //     Caption = 'Test';
            //     ApplicationArea = All;
            //     trigger OnAction()
            //     begin
            //         Message('value is %1', Rec.CalculateCreditLimit);
            //     end;
            // }
        }
    }
    local procedure CallUpdateCreditLimit()
    var
        lCreditLimitCalculated: Decimal;
        lCreditLimitActual: Decimal;
    begin
        lCreditLimitCalculated := Rec.CalculateCreditLimit();
        lCreditLimitActual := rec."Credit Limit (LCY)";
        if (lCreditLimitActual = lCreditLimitCalculated) then begin
            Message(TextUpToDate);
            exit;
        end
        else begin
            if (Confirm(TextConfirm, true, Rec.CalculateCreditLimit())) = false then begin
                exit;
            end
            else begin
                Rec.UpdateCreditLimit(lCreditLimitCalculated);
                Message(TextRounded);
            end;
        end;


    end;

    var
        myInt: Integer;
        TextConfirm: Label 'Are you sure that you want to set the Credit Limit(LCY) to %1';
        TextRounded: Label 'The credit limit was rounded to 0 to comply with company policies.';
        TextUpToDate: Label 'The credit limit was up-to-date!';

}