namespace APIIntegration.APIIntegration;

page 50350 "API Integration page"
{
    ApplicationArea = All;
    Caption = 'API Integration';
    PageType = Card;
    SourceTable = "API Integration";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Username; Rec.Username) { ApplicationArea = All; }
                field("Token Key"; Rec.Password) { ApplicationArea = All; }
                field("Base URL"; Rec."Base URL") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TestConnection)
            {
                Caption = 'Test Connection';
                ApplicationArea = All;
                trigger OnAction()
                var
                    APIMgt: Codeunit "API Integration";
                begin
                    APIMgt.TestConnection(Rec);
                end;
            }

            action(GetData)
            {
                Caption = 'Get Data';
                ApplicationArea = All;
                trigger OnAction()
                var
                    APIMgt: Codeunit "API Integration";
                begin
                    APIMgt.GetData(Rec);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if not Rec.Get('SETUP') then begin
            Rec.Init();
            Rec."Primary Key" := 'SETUP'; // must exist in your table definition
            Rec.Insert();
        end;
    end;
}
