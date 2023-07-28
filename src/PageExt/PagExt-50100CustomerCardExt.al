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
                    CallUpdateCreditLimit(rec);
                end;
            }
        }
    }
    local procedure CallUpdateCreditLimit(var c: Record Customer)
    var
        lCreditLimitCalculated: Decimal;
        lCreditLimitActual: Decimal;

    begin
        lCreditLimitCalculated := c.CalculateCreditLimit(c);
        lCreditLimitCalculated := Round(lCreditLimitCalculated / 10000) * 10000;
        lCreditLimitActual := c."Credit Limit (LCY)";
        if (lCreditLimitActual = lCreditLimitCalculated) then begin
            Message(TextUpToDate);
            exit;
        end
        else begin
            if (Confirm(TextConfirm, true, lCreditLimitCalculated)) = false then begin
                exit;
            end
            else begin
                c.UpdateCreditLimit(lCreditLimitCalculated, c);
                Message(TextRounded);
                Message(c."No.");
            end;
        end;


    end;

    var
        myInt: Integer;
        TextConfirm: Label 'Are you sure that you want to set the Credit Limit(LCY) to %1';
        TextRounded: Label 'The credit limit was rounded to 0 to comply with company policies.';
        TextUpToDate: Label 'The credit limit was up-to-date!';

}