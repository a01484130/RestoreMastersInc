<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile ="~/Services.aspx.cs" Inherits="Microsofties1.Services" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
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
        <asp:Button ID="Button1" runat="server" Text="Insert a new service" OnClick="Button1_Click" Height="50px" Width="200px" Font-Size="Medium"  Font-Bold ="true" ForeColor="#CC0000" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl ="ServicesReport.aspx" Target ="_blank" Font-Size="X-Large" ForeColor="#CC0000">Run Report</asp:HyperLink>
   </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ServiceID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Large" PageSize="25">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Service Description" SortExpression="ServiceDesc">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ServiceDesc") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please select service description." Text ="*" Display="Dynamic" ControlToValidate="Textbox4"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ServiceDesc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Equipment Name" SortExpression="EquipmentName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" SelectedValue = '<%# Bind("EquipmentID") %>' runat="server" DataSourceID="SqlDataSource3" DataTextField="EquipmentName" DataValueField="EquipmentID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Microsofties %>" SelectCommand="SELECT [EquipmentName], [EquipmentID] FROM [Equipment]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please select equipment name." Text ="*" Display="Dynamic" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EquipmentName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service Type" SortExpression="ServiceType">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue = '<%# Bind("ServiceType") %>'>
                            <asp:ListItem Text="Routine" Value ="Routine"></asp:ListItem>
                            <asp:ListItem Text ="Needed" Value ="Needed"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please select service type." Text ="*" Display="Dynamic" ControlToValidate="DropDownList2"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("ServiceType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ServiceVendor" HeaderText="Service Vendor" SortExpression="ServiceVendor" />
                <asp:TemplateField HeaderText="Service Cost" SortExpression="ServiceCost">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ServiceCost", "{0:F2}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Please select service cost." Text ="*" Display="Dynamic" ControlToValidate="Textbox2"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Please enter a positive number for service cost" Text ="*" Type ="Currency" ControlToValidate ="TextBox2" Operator ="GreaterThan" ValueToCompare="0" Display ="Dynamic"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ServiceCost", "{0:c}") %>'></asp:Label>
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
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("ServiceDt", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Receipt" SortExpression="Receipt">
                    <EditItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("Receipt") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="DownloadButton" runat="server" Text='<%# Bind("Receipt") %>'  OnClick ="DownloadButton_Click"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service Notes" SortExpression="ServiceNotes">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ServiceNotes") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ServiceNotes") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="580px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ServiceID" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" GridLines="None" OnItemCommand="DetailsView1_ItemCommand" Visible="False" Font-Size="Medium">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:TemplateField HeaderText="Service Description" SortExpression="ServiceDesc">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("ServiceDesc") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please specify service description." Text ="*" Display="Dynamic" ControlToValidate="Textbox13"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Equipment" SortExpression="EquipmentID">
                    <InsertItemTemplate>
                         <asp:DropDownList ID="DropDownList11" SelectedValue = '<%# Bind("EquipmentID") %>' runat="server" DataSourceID="SqlDataSource3" DataTextField="EquipmentName" DataValueField="EquipmentID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Microsofties %>" SelectCommand="SELECT [EquipmentName], [EquipmentID] FROM [Equipment]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select equipment." Text ="*" Display="Dynamic" ControlToValidate="DropDownList11"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service Type" SortExpression="ServiceType">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList12" runat="server" SelectedValue = '<%# Bind("ServiceType") %>'>
                            <asp:ListItem Text="Routine" Value ="Routine"></asp:ListItem>
                            <asp:ListItem Text ="Needed" Value ="Needed"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select service type." Text ="*" Display="Dynamic" ControlToValidate="DropDownList12"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service Vendor" SortExpression="ServiceVendor">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("ServiceVendor") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please specify service vendor." Text ="*" Display="Dynamic" ControlToValidate="Textbox14"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service Cost" SortExpression="ServiceCost">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("ServiceCost", "{0:c}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please specify service cost." Text ="*" Display="Dynamic" ControlToValidate="TextBox11"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Please enter a positive number for service cost" Text ="*" Type ="Currency" ControlToValidate ="TextBox11" Operator ="GreaterThan" ValueToCompare="0" Display ="Dynamic"></asp:CompareValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service Date" SortExpression="ServiceDt">
                    <InsertItemTemplate>
                        <asp:DropDownList id="YearList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="YearList_SelectedIndexChanged"></asp:DropDownList>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please upload receipt." Text ="*" Display="Dynamic" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Receipt File Name" SortExpression="Receipt" >
                    <InsertItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Receipt") %>' ></asp:Label>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service Notes" SortExpression="ServiceNotes">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ServiceNotes") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ServiceNotes") %>' TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ServiceNotes") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    <asp:ValidationSummary id ="ValidationSummary1" runat="server" ShowMessageBox ="true" ForeColor="White"></asp:ValidationSummary>
</asp:Content>