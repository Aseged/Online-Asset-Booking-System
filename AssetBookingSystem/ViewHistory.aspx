<%@ Page Title="" Language="C#" MasterPageFile="~/systemManage.Master" AutoEventWireup="true" CodeBehind="ViewHistory.aspx.cs" Inherits="AssetBookingSystem.ViewHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin:0 auto 0 auto; width:200px; height:1%;"><h2 style="color:black;">Booking History</h2></div>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                                    Width="100%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="0px" 
                                    CellPadding="10" padding="2px" ForeColor="#333333" GridLines="None" ShowFooter="True" 
                                    HorizontalAlign="Center" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" EmptyDataText="There is no booking history to display." DataKeyNames="ID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" >
                 <AlternatingRowStyle BackColor="#f1f1f1" />

                 <Columns>
                     <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                     <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                     <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                     <asp:BoundField DataField="StartDate" HeaderText="StartDate" ReadOnly="True" SortExpression="StartDate" />
                     <asp:BoundField DataField="EndDate" HeaderText="EndDate" ReadOnly="True" SortExpression="EndDate" />
                     <asp:BoundField DataField="StartTime" HeaderText="StartTime" ReadOnly="True" SortExpression="StartTime" />
                     <asp:BoundField DataField="EndTime" HeaderText="EndTime" ReadOnly="True" SortExpression="EndTime" />
                     <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                 </Columns>

            </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AssetBookingSystemConnectionString %>" SelectCommand="procPastBooking" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</asp:Content>
