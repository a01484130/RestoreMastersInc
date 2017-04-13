<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile ="~/Equipment.aspx.cs" Inherits="Microsofties1.Equipment" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Microsofties %>" DeleteCommand="DELETE FROM [Equipment] WHERE [EquipmentID] = @EquipmentID" InsertCommand="INSERT INTO [Equipment] ([EquipmentType], [EquipmentName], [AcquiredDt], [AcquiredCost], [Vendor]) VALUES (@EquipmentType, @EquipmentName, @AcquiredDt, @AcquiredCost, @Vendor)" SelectCommand="SELECT [EquipmentID], [EquipmentType], [EquipmentName], [AcquiredDt], [AcquiredCost], [Vendor] FROM [Equipment]" UpdateCommand="UPDATE [Equipment] SET [EquipmentType] = @EquipmentType, [EquipmentName] = @EquipmentName, [AcquiredDt] = @AcquiredDt, [AcquiredCost] = @AcquiredCost, [Vendor] = @Vendor WHERE [EquipmentID] = @EquipmentID">
            <DeleteParameters>
                <asp:Parameter Name="EquipmentID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EquipmentType" Type="String" />
                <asp:Parameter Name="EquipmentName" Type="String" />
                <asp:Parameter DbType="Date" Name="AcquiredDt" />
                <asp:Parameter Name="AcquiredCost" Type="Decimal" />
                <asp:Parameter Name="Vendor" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EquipmentType" Type="String" />
                <asp:Parameter Name="EquipmentName" Type="String" />
                <asp:Parameter DbType="Date" Name="AcquiredDt" />
                <asp:Parameter Name="AcquiredCost" Type="Decimal" />
                <asp:Parameter Name="Vendor" Type="String" />
                <asp:Parameter Name="EquipmentID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Insert new equipment" OnClick="Button1_Click" Height="50px" Width="200px" Font-Size="Medium" Font-Bold ="true"  ForeColor="#CC0000" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink3" runat="server" Target="_blank" NavigateUrl ="EquipmentReport.aspx" Font-Size ="X-Large" ForeColor="#CC0000">Run Report</asp:HyperLink>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EquipmentID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Font-Size="Large" PageSize="25">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Equipment Type" SortExpression="EquipmentType">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EquipmentType") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please specify equipment type." Text ="*" Display="Dynamic" ControlToValidate="Textbox2"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EquipmentType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Equipment Name" SortExpression="EquipmentName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EquipmentName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please specify equipment name/description." Text ="*" Display="Dynamic" ControlToValidate="Textbox1"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("EquipmentName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Vendor" SortExpression="Vendor">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Vendor") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please specify equipment vendor." Text ="*" Display="Dynamic" ControlToValidate="Textbox5"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Vendor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acquired Cost" SortExpression="AcquiredCost">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("AcquiredCost",  "{0:F2}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please specify equipment cost." Text ="*" Display="Dynamic" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Please enter a valid number for equipment cost (positive number, no $)" Text ="*" Type ="Currency" ControlToValidate ="TextBox4" Operator ="GreaterThan" ValueToCompare="0.0" Display ="Dynamic"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("AcquiredCost", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acquired Date" SortExpression="AcquiredDt">
                    <EditItemTemplate>
                     <asp:Calendar ID="Calendar1" runat="server" SelectedDate ='<%# Bind("AcquiredDt") %>' VisibleDate ='<%# Eval("AcquiredDt") %>' BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                     </asp:Calendar>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("AcquiredDt", "{0:d}") %>'></asp:Label>
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
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="EquipmentID" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" GridLines="None" OnItemCommand="DetailsView1_ItemCommand" Visible="False" Font-Size="Medium">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:TemplateField HeaderText="Equipment ID" InsertVisible="False" SortExpression="EquipmentID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("EquipmentID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EquipmentID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Equipment Type" SortExpression="EquipmentType">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EquipmentType") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("EquipmentType") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please specify equipment type." Text ="*" Display="Dynamic" ControlToValidate="Textbox5"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EquipmentType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Equipment Name/Description" SortExpression="EquipmentName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EquipmentName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("EquipmentName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please specify equipment name/description." Text ="*" Display="Dynamic" ControlToValidate="Textbox6"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("EquipmentName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Vendor" SortExpression="Vendor">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Vendor") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Vendor") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please specify equipment vendor." Text ="*" Display="Dynamic" ControlToValidate="Textbox7"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Vendor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acquired Cost" SortExpression="AcquiredCost">
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("AcquiredCost", "{0:c}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please specify equipment cost." Text ="*" Display="Dynamic" ControlToValidate="Textbox8"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Please enter a positive number for equipment cost" Text ="*" Type ="Currency" ControlToValidate ="TextBox8" Operator ="GreaterThan" ValueToCompare="0" Display ="Dynamic"></asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("AcquiredCost", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acquired Date" SortExpression="AcquiredDt">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("AcquiredDt") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                      <asp:DropDownList id="YearList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="YearList_SelectedIndexChanged"></asp:DropDownList>
                     <asp:Calendar ID="Calendar1" runat="server" SelectedDate ='<%# Bind("AcquiredDt") %>' BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                     </asp:Calendar>
                   </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("AcquiredDt") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    </div>
    <asp:ValidationSummary id ="ValidationSummary1" runat="server" ShowMessageBox ="true" ForeColor="White"></asp:ValidationSummary>
</asp:Content>