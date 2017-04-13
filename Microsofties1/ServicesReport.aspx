<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeBehind="ServicesReport.aspx.cs" Inherits="Microsofties1.ServicesReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID ="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="1422px" ProcessingMode="Remote" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1461px">
               <ServerReport ReportPath="/Services" />
               <LocalReport DisplayName ="Services"></LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="Microsofties1.MicrosoftiesDataSet1TableAdapters.ServicesTableAdapter"></asp:ObjectDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=alexsb;Initial Catalog=Microsofties;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Services]"></asp:SqlDataSource>
    </div>
</asp:Content>
