/// <summary>
/// Codeunit MyCodeunit (ID 50100).
/// </summary>
codeunit 50100 MyCodeunit
{
    trigger OnRun()
    begin
        MESSAGE('The value of %1 is %2', 'YesOrNo', lYesOrNo);
        MESSAGE('The value of %1 is %2', 'Amount', lAmount);
        MESSAGE('The value of %1 is %2', 'When Was It', "lWhen Was It");
        MESSAGE('The value of %1 is %2', 'What Time', "lWhat Time");
        MESSAGE('The value of %1 is %2', 'Description', lDescription);
        MESSAGE('The value of %1 is %2', 'Code Number', "lCode Number");
        MESSAGE('The value of %1 is %2', 'Ch', lCh);
        MESSAGE('The value of %1 is %2', 'Color', lColor);
    end;

    var
        lLoopNo: Integer;
        lYesOrNo: Boolean;
        lAmount: Decimal;
        "lWhen Was It": Date;
        "lWhat Time": Time;
        lDescription: Text[30];
        "lCode Number": Code[10];
        lCh: Char;
        lColor: Enum "My Color";
}
