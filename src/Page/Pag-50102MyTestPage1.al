/// <summary>
/// Page My Test Page 1 (ID 50102).
/// </summary>
page 50102 "My Test Page 1"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    // SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(General)
            {
                group(Input)
                {
                    field(gValue1; gValue1)
                    {

                    }
                    field(gValue2; gValue2)
                    {

                    }
                }
                group(Output)
                {
                    field(gResult; gResult)
                    {
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if (gValue1 > gValue2) then
                        gResult := true;
                end;
            }
            action(Reset)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    gValue1 := 0;
                    gValue2 := 0;
                    gResult := false
                end;


            }
        }
    }
    /// <summary>
    /// Reset.
    /// </summary>


    var
        gValue1: Integer;
        gValue2: Integer;
        gResult: Boolean;
}