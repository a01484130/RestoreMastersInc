<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Microsofties1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
            <asp:Image ID="Image1" runat="server" ImageUrl ="~/Images/logo.png" Height ="200" Width ="400"></asp:Image>
        <br />
    <h3>
        Brought to you by: the Microsofties
    </h3>
    </center>
    <ul>
    <li> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Equipment.aspx" Font-Size="X-Large">Equipment</asp:HyperLink></li>
    <li> <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Services.aspx" Font-Size="X-Large">Services</asp:HyperLink></li>
    </ul>
   </div>
   </form>
</body>
</html>
