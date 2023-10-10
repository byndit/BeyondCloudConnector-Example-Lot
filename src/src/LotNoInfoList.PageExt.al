pageextension 60011 "PTE BCC Lot No. Info. List" extends "Lot No. Information List"
{
    layout
    {
        addfirst(factboxes)
        {
            part("PTE BCC Dropzone"; "BYD Dropzone Fact Box")
            {
                ApplicationArea = All;
                Visible = PTEBCCIsDropzoneReady and PTEBCCIsDropzoneVisible;
            }
            part("PTE BCC FilePreview"; "BYD File Preview")
            {
                ApplicationArea = All;
                Visible = PTEBCCIsDropzoneReady and PTEBCCIsFilePreviewVisible;
                Provider = "PTE BCC Dropzone";
                SubPageLink = "File No." = field("File No.");
            }
        }
    }

    trigger OnOpenPage()
    var
        CloudStorageMgt: Codeunit "BYD Cloud Storage Mgt.";
    begin
        PTEBCCIsDropzoneReady := CurrPage."PTE BCC Dropzone".Page.IsDropzoneReady(Rec.RecordId().TableNo());
        PTEBCCIsDropzoneVisible := CloudStorageMgt.DropzoneVisible(Rec.RecordId().TableNo());
        PTEBCCIsFilePreviewVisible := CloudStorageMgt.FilePreviewVisible(Rec.RecordId().TableNo());
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        EmptyRecId: RecordId;
    begin
        if Rec.RecordId() <> EmptyRecId then
            CurrPage.Update();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage."PTE BCC Dropzone".Page.SetRecID(Rec.RecordId());
        CurrPage."PTE BCC FilePreview".Page.SetRecID(Rec.RecordId());
    end;

    var
        PTEBCCIsDropzoneReady: Boolean;
        PTEBCCIsDropzoneVisible: Boolean;
        PTEBCCIsFilePreviewVisible: Boolean;
}