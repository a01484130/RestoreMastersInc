<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Microsofties1.Services" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <asp:Image ID="Image1" runat="server" ImageUrl ="~/Images/logo.png"></asp:Image>
        </center>
        <br />
        <center>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl ="~/Default.aspx" Font-Size="X-Large">Home</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl ="~/Equipment.aspx" Font-Size="X-Large">Equipment</asp:HyperLink>
        </center>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Microsofties %>" DeleteCommand="DELETE FROM [Services] WHERE [ServiceID] = @ServiceID" InsertCommand="INSERT INTO [Services] ([ServiceDesc], [EquipmentID], [ServiceNotes], [ServiceType], [ServiceCost], [ServiceDt], [Receipt], [ServiceVendor]) VALUES (@ServiceDesc, @EquipmentID, @ServiceNotes, @ServiceType, @ServiceCost, @ServiceDt, @Receipt, @ServiceVendor)" SelectCommand="SELECT [ServiceID], [ServiceDesc], s.EquipmentID, e.EquipmentName, [ServiceNotes], [ServiceType], [ServiceCost], [ServiceDt], [Receipt], [ServiceVendor] FROM Services as s JOIN Equipment e on s.EquipmentID = e.EquipmentID" UpdateCommand="UPDATE [Services] SET [ServiceDesc] = @ServiceDesc, [EquipmentID] = @EquipmentID, [ServiceNotes] = @ServiceNotes, [ServiceType] = @ServiceType, [ServiceCost] = @ServiceCost, [ServiceDt] = @ServiceDt, [Receipt] = @Receipt, [ServiceVendor] = @ServiceVendor WHERE [ServiceID] = @ServiceID">
            <DeleteParameters>
                <asp:Parameter Name="ServiceID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ServiceDesc" Type="String" />
                <asp:Parameter Name="EquipmentID" Type="Int32" />
                <asp:Parameter Name="ServiceNotes" Type="String" />
                <asp:Parameter Name="ServiceType" Type="String" />
                <asp:Parameter Name="ServiceCost" Type="Decimal" />
                <asp:Parameter Name="ServiceDt" Type="DateTime" />
                <asp:Parameter Name="Receipt" Type="String" />
                <asp:Parameter Name="ServiceVendor" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ServiceDesc" Type="String" />
                <asp:Parameter Name="EquipmentID" Type="Int32" />
                <asp:Parameter Name="ServiceNotes" Type="String" />
                <asp:Parameter Name="ServiceType" Type="String" />
                <asp:Parameter Name="ServiceCost" Type="Decimal" />
                <asp:Parameter Name="ServiceDt" Type="DateTime" />
                <asp:Parameter Name="Receipt" Type="String" />
                <asp:Parameter Name="ServiceVendor" Type="String" />
                <asp:Parameter Name="ServiceID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Insert a new service" OnClick="Button1_Click" Height="50px" Width="200px" Font-Size="Medium"  Font-Bold ="true"/>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl ="ServicesReport.aspx" Target ="_blank" Font-Size="X-Large">Run Report</asp:HyperLink>
   </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ServiceID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Large">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Service ID" InsertVisible="False" SortExpression="ServiceID">
                </asp:TemplateField>
                <asp:BoundField DataField="ServiceDesc" HeaderText="Service Description" SortExpression="ServiceDesc" />
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="EquipmentName" SortExpression="EquipmentName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" SelectedValue = '<%# Bind("EquipmentID") %>' runat="server" DataSourceID="SqlDataSource3" DataTextField="EquipmentName" DataValueField="EquipmentID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Microsofties %>" SelectCommand="SELECT [EquipmentName], [EquipmentID] FROM [Equipment]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EquipmentName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ServiceNotes" HeaderText="Service Notes" SortExpression="ServiceNotes" />
                <asp:BoundField DataField="ServiceType" HeaderText="Service Type" SortExpression="ServiceType" />
                <asp:TemplateField HeaderText="Service Cost" SortExpression="ServiceCost">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ServiceCost", "{0:F2}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ServiceCost", "{0:F2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service Date" SortExpression="ServiceDt">
                    <EditItemTemplate>
                       <asp:Calendar ID="Calendar1" runat="server" SelectedDate ='<%# Bind("ServiceDt") %>' VisibleDate ='<%# Eval("ServiceDt") %>' BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                     </asp:Calendar>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("ServiceDt") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Receipt" SortExpression="Receipt">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Receipt") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button2" runat="server" Text='<%# Bind("Receipt") %>'  OnClick ="Button2_Click"/>
                        <%--<asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Bind("Receipt") %>' PostBackUrl ='<%# Eval("Receipt", "Receipts/{0}") %>'  ></asp:LinkButton>--%>
                        <%--<asp:Label ID="Label3" runat="server" Text='<%# Bind("Receipt") %>'></asp:Label>--%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ServiceVendor" HeaderText="Service Vendor" SortExpression="ServiceVendor" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ServiceID" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" GridLines="None" OnItemCommand="DetailsView1_ItemCommand" Visible="False" Font-Size="Medium">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <%--<asp:BoundField DataField="ServiceID" HeaderText="Service ID" InsertVisible="False" ReadOnly="True" SortExpression="ServiceID" />--%>
                <asp:BoundField DataField="ServiceDesc" HeaderText="Service Description" SortExpression="ServiceDesc" />
                <asp:TemplateField HeaderText="Equipment" SortExpression="EquipmentID">
                    <InsertItemTemplate>
                         <asp:DropDownList ID="DropDownList1" SelectedValue = '<%# Bind("EquipmentID") %>' runat="server" DataSourceID="SqlDataSource3" DataTextField="EquipmentName" DataValueField="EquipmentID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Microsofties %>" SelectCommand="SELECT [EquipmentName], [EquipmentID] FROM [Equipment]"></asp:SqlDataSource>
                        <%--<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("EquipmentID") %>'></asp:TextBox>--%>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ServiceNotes" HeaderText="Service Notes" SortExpression="ServiceNotes" />
                <asp:TemplateField HeaderText="Service Type" SortExpression="ServiceType">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ServiceType") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service Cost" SortExpression="ServiceCost">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ServiceCost", "{0:F2}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service Date" SortExpression="ServiceDt">
                    <InsertItemTemplate>
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" SelectedDate ='<%# Bind("ServiceDt") %>' BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Receipt Upload" SortExpression="Receipt">
                    <InsertItemTemplate>
                        <asp:FileUpload id ="FileUpload1" runat="server" OnLoad="FileUpload1_Load"></asp:FileUpload>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Receipt File Name" SortExpression="Receipt">
                    <InsertItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Receipt") %>'></asp:Label>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ServiceVendor" HeaderText="Service Vendor" SortExpression="ServiceVendor" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    </form>
</body>
</html>
