/// <summary>
/// Page CustomerOverview List (ID 50103).
/// </summary>
page 50103 "CustomerOverview List"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CustomerOverview";

    layout
    {
        area(Content)
        {
            repeater(Customer)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Source Code"; rec."Source Code")
                {
                    ApplicationArea = All;
                }
                field("Amount"; rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("LastRunDate"; rec.LastRunDate)
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Update Customer Overview")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    c: Codeunit UpdateCO;
                begin
                    c.Run();

                end;
            }
        }
    }

    var
        myInt: Integer;
}