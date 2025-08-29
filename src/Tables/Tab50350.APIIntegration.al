table 50350 "API Integration"
{
    Caption = 'API Integration';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = SystemMetadata;
        }

        field(2; "Username"; Text[100])
        {
            Caption = 'Username';
        }

        field(3; "Password"; Text[250])
        {
            Caption = 'Token Key';
            ExtendedDatatype = Masked;

        }

        field(4; "Base URL"; Text[250])
        {
            Caption = 'Base URL';
        }
    }

    keys
    {
        key(PK; "Primary Key") { Clustered = true; }
    }
}

