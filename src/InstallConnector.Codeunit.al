codeunit 60010 "PTE BCC Install Connector"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        InstallCCApp();
    end;

    procedure InstallCCApp()
    var
        ReasonLbl: Label 'PTE-BCC-INSTALL-2023-10.2', Locked = true;
    begin
        if UpgradeTag.HasUpgradeTag(ReasonLbl) then
            exit;

        Codeunit.Run(Codeunit::"PTE BCC Install Custom Table");

        UpgradeTag.SetUpgradeTag(ReasonLbl);
    end;

    var
        UpgradeTag: Codeunit "Upgrade Tag";
}