/// <summary>
/// XmlPort Course Export Variable (ID 50100).
/// </summary>
xmlport 50101 "Course Export XML Doc"
{
    Format = Xml;
    Direction = Export;
    // TextEncoding = UTF8;
    // UseRequestPage = false;
    // TableSeparator = '';//New line

    schema
    {
        textelement(Root)
        {
            // tableelement(Integer; Integer)
            // {
            //     XmlName = 'CourseHeader';
            //     textelement(CodeTitle)
            //     {
            //         trigger OnBeforePassVariable()
            //         begin
            //             CodeTitle := Course.FieldCaption(Code);
            //         end;
            //     }
            //     textelement(NameTitle)
            //     {
            //         trigger OnBeforePassVariable()
            //         begin
            //             NameTitle := Course.FieldCaption(Name);
            //         end;
            //     }
            //     textelement(DescriptionTitle)
            //     {
            //         trigger OnBeforePassVariable()
            //         begin
            //             DescriptionTitle := Course.FieldCaption(Description);
            //         end;
            //     }
            //     textelement(TypeTitle)
            //     {
            //         trigger OnBeforePassVariable()
            //         begin
            //             TypeTitle := Course.FieldCaption(Type);
            //         end;
            //     }
            //     textelement(DurationTitle)
            //     {
            //         trigger OnBeforePassVariable()
            //         begin
            //             DurationTitle := Course.FieldCaption(Duration);
            //         end;
            //     }
            //     textelement(PriceTitle)
            //     {
            //         trigger OnBeforePassVariable()
            //         begin
            //             PriceTitle := Course.FieldCaption(Price);
            //         end;
            //     }
            //     textelement(ActiveTitle)
            //     {
            //         trigger OnBeforePassVariable()
            //         begin
            //             ActiveTitle := Course.FieldCaption(Active);
            //         end;
            //     }
            //     textelement(DifficultyTitle)
            //     {
            //         trigger OnBeforePassVariable()
            //         begin
            //             DifficultyTitle := Course.FieldCaption(Difficulty);
            //         end;
            //     }
            //     textelement(PassingRateTitle)
            //     {
            //         trigger OnBeforePassVariable()
            //         begin
            //             PassingRateTitle := Course.FieldCaption("Passing Rate");
            //         end;
            //     }
            // }
            tableelement(Course; Course)
            {
                XmlName = 'CourseItem';
                //RequestFilterFields = "No.";
                fieldattribute(Code; Course.Code)
                {
                }
                fieldattribute(Name; Course.Name)
                {
                }
                fieldattribute(Description; Course.Description)
                {
                }
                fieldattribute(Type; Course.Type)
                {
                }
                fieldattribute(Duration; Course.Duration)
                {
                }
                fieldattribute(Price; Course.Price)
                {
                }
                fieldattribute(Active; Course.Active)
                {
                }
                fieldattribute(Difficulty; Course.Difficulty)
                {
                }
                fieldattribute(PassingRate; Course."Passing Rate")
                {
                }
            }
        }
    }
}