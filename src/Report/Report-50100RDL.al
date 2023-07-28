/// <summary>
/// Report ReportRDL (ID 50100).
/// </summary>
report 50100 ReportRDL
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutRDL;
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
        layout(LayoutRDL)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
        layout(LayoutWord)
        {
            Type = Word;
            LayoutFile = 'mylayout.docx';
        }
    }

    var
        myInt: Integer;
}