namespace APIIntegration.APIIntegration;

codeunit 50350 "API Integration"
{
    procedure TestConnection(Setup: Record "API Integration")
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        Headers: HttpHeaders;
        ResultText: Text;
    begin
        Client.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + Setup.Password);
        Client.DefaultRequestHeaders.Add('Username', Setup."Username");

        if Client.Get(Setup."Base URL", Response) then begin
            if Response.IsSuccessStatusCode() then begin
                Message('Connection successful! Status: %1', Response.HttpStatusCode());
            end else begin
                Response.Content().ReadAs(ResultText);
                Error('Connection failed. Status: %1 - %2', Response.HttpStatusCode(), ResultText);
            end;
        end else
            Error('Failed to connect to API.');
    end;

    procedure GetData(Setup: Record "API Integration")
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        JsonObj: JsonObject;
        ResultText: Text;
    begin
        Client.DefaultRequestHeaders.Clear();
        Client.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + Setup.Password);

        if Client.Get(Setup."Base URL", Response) then begin
            Response.Content().ReadAs(ResultText);
            if Response.IsSuccessStatusCode() then begin
                Message('Raw JSON: %1', ResultText);
            end else
                Error('Failed to fetch data. Status: %1, Body: %2',
                      Response.HttpStatusCode(), ResultText);
        end else
            Error('Error connecting to API.');
    end;
}
