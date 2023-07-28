/// <summary>
/// Report ReportRDL (ID 50100).
/// </summary>
report 50101 ReportWord
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutWord;
    dataset
    {

        dataitem(Course; Course)
        {
            //DataItemTableView = SORTING("Name");
            column(Code; Code)
            {
            }
            column(Name; Name)
            {
            }
            column(Description; Description)
            {
            }
            column(Type; Type)
            {
            }
            column(Duration; Duration)
            {
            }
            column(Price; Price) { }
            column(Active; Active) { }
            column(Difficulty; Difficulty)
            {
            }
            column(Passing_Rate; "Passing Rate") { }
        }
    }

    requestpage
    {
    }

    rendering
    {
        layout(LayoutWord)
        {
            Type = Word;
            LayoutFile = 'mylayout.docx';
        }
    }

    var
        myInt: Integer;
}