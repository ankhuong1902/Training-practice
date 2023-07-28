/// <summary>
/// Page Course List (ID 50101).
/// </summary>
page 50101 "Course List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Course;
    CardPageId = "Course Card";

    layout
    {
        area(Content)
        {
            repeater(CourseList)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                // field(Difficulty; Rec.Difficulty)
                // {
                //     ApplicationArea = All;
                // }
                // field("Passing Rate"; Rec."Passing Rate")
                // {
                //     ApplicationArea = All;
                // }
                field(gLevel; gLevel)
                {
                    ApplicationArea = All;
                }
                field(gSuggestion; gSuggestion)
                {
                    ApplicationArea = All;
                }
                field(gSPA; gSPA)
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
            action("Export Variable Text")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50100, false, false);
                end;
            }
            action("Export XML Document")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.run(50101, false, false);
                end;
            }
            action("Print")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    r: Report ReportRDL;
                begin
                    r.Run();
                end;
            }
            action(RunCodeunit)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    c: Codeunit MyCodeunit;
                begin
                    c.Run();
                end;

            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        case rec.Difficulty of
            1 .. 5:
                begin
                    gLevel := 'Beginner';
                    gSuggestion := 'Take e-Learning or remote training';
                end;
            6 .. 8:
                begin
                    gLevel := 'Intermediate';
                    gSuggestion := 'Attend instructor-Led';
                end;
            9, 10:
                begin
                    gLevel := 'Advanced';
                    gSuggestion := 'Attend instructor-Led and self study';
                end;

        end;
        if ((rec."Passing Rate" >= 70) and (rec.Difficulty >= 6)) then
            gSPA := true;
    end;

    var
        myInt: Integer;
        gLevel:
                Text[30];
        gSuggestion:
                Text[50];
        gSPA:
                Boolean;
}