<%@ Page Title="" Language="C#" MasterPageFile="~/systemManage.Master" AutoEventWireup="true" CodeBehind="manageROOMs.aspx.cs" Inherits="AssetBookingSystem.manageROOMs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="align-content:center; width:50%; margin-left:auto; margin-right:auto;">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="Room" DataSourceID="SqlDataSource1"
         ForeColor="#333333" GridLines="None" ShowFooter="false"  
         Width="100%"  CellPadding="10" padding="2px">

        <AlternatingRowStyle BackColor="#f1f1f1" />

        <Columns>

            
                     <asp:TemplateField ShowHeader="False">
                         

                         <ItemTemplate>
                             
                             </br>
                             <asp:LinkButton ID="LinkButton2" runat="server" CssClass="EditButtonsRoom" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this Room?');"></asp:LinkButton>
                         
                                 </ItemTemplate>
                         <ControlStyle CssClass="EditButtons" ForeColor="White" />
                     </asp:TemplateField>

          <asp:BoundField DataField="Room" HeaderText="Room" ReadOnly="True" SortExpression="Room" />
           <asp:BoundField DataField="Campus" HeaderText="Campus" SortExpression="Campus" />

        </Columns>
    </asp:GridView>
    

 <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AssetBookingSystemConnectionString %>" SelectCommand="SELECT * FROM [tblROOMS]"></asp:SqlDataSource>
    --%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AssetBookingSystemConnectionString %>" DeleteCommand="DELETE FROM [tblROOMS] WHERE [Room] = @Room" InsertCommand="INSERT INTO [tblROOMS] ([Room], [Campus]) VALUES (@Room, @Campus)" SelectCommand="SELECT * FROM [tblROOMS]" UpdateCommand="UPDATE [tblROOMS] SET [Room] = @Room, [Campus] = @Campus WHERE [Room] = @Room">
                <DeleteParameters>
                    <asp:Parameter Name="Room" Type="String" />
                </DeleteParameters>
                
            </asp:SqlDataSource>
     <br /><asp:Button ID="InsertNew" CssClass="buttonInsertNew" OnClick="InsertNew_Click" runat="server" Text="Insert New Room" />
    <br /> <br /> <br />         
                                    
</div>
</asp:Content>

