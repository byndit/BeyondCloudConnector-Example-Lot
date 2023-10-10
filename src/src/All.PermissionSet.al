permissionset 60010 "PTE BCC All"
{
    Access = Internal;
    Assignable = true;
    Caption = 'BeyondCloudConnector-Lot All permissions', Locked = true;

    Permissions =
         codeunit "PTE BCC Install Connector" = X,
         codeunit "PTE BCC Install Custom Table" = X;
}