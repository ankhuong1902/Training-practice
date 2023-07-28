/// <summary>
/// Page CourseInfoPage (ID 50100).
/// </summary>
page 50100 "Course Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Course;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("Name"; rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                }
                field("Instructor Code"; Rec."Instructor Code")
                {
                    ApplicationArea = All;
                }
                field("Instructor Name"; Rec."Instructor Name")
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
            action("Resource Card")
            {
                ApplicationArea = All;
                RunObject = Page "Resource Card";
                RunPageLink = "No." = field("Instructor Code");
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin

                end;
            }
            action(Print)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    lReport: Report "ReportWord";
                    lRec_Course: Record "Course";
                begin
                    lRec_Course.SetRange(Code, Rec.Code);
                    lRec_Course.FindSet();
                    REPORT.RunModal(Report::"ReportWord", true, true, lRec_Course);
                end;
            }
        }
    }

    var
        myInt: Integer;
}