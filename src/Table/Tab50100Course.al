/// <summary>
/// Table CourseInfo (ID 50100).
/// </summary>
table 50100 Course
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(20; Name; Text[37])
        {
            DataClassification = ToBeClassified;
        }
        field(30; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(40; Type; Enum "Course Type")
        {

            DataClassification = ToBeClassified;
        }
        field(50; Duration; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60; Price; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70; Active; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80; Difficulty; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(90; "Passing Rate"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(100; "Instructor Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource where(Type = const(Person));
        }
        field(120; "Instructor Name"; Text[100])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Resource.Name WHERE("No." = FIELD("Instructor Code")));
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
