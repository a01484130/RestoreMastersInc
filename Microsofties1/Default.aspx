<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Microsofties1.Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="auto-style1">
        <br/>
        <br/>
        <br/>
        <br/>
<h1> Equipment and Service Tracking</h1>
     <br/>
     <br/>
        <asp:Image ID="Image1" runat="server" ImageUrl ="Images/car.png" Height =" 180" Width ="180"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image3" runat="server" ImageUrl ="Images/van.png" Height ="180" Width ="180 "/>
        <br />
        <asp:Image ID="Image2" runat="server" ImageUrl ="Images/tools.png"  Height ="250" Width ="250"/>
   </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <meta charset="UTF-8"><title>Restore Masters</title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
        .auto-style1 {
            height: 891px;
        }
    </style>
</asp:Content>
