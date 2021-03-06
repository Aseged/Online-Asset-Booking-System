﻿<%@ Page Title="" Language="C#" MasterPageFile="~/system.Master" AutoEventWireup="true" CodeBehind="MyBooking.aspx.cs" Inherits="AssetBookingSystem.MyBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin:0 auto 0 auto; width:200px; height:1%;"><h2 style="color:black;">Current Booking</h2></div>
    
             <br /><asp:Label ID="checkError" CssClass="SameDayBooking" runat="server" Visible="false" Text="No selection has been made. Select a booking to delete please!"></asp:Label> 
             <asp:Label ID="noBookingError" CssClass="SameDayBooking" runat="server" Visible="false" Text="No booking record found for you! Your booking history cannot be viewed here."></asp:Label> <br /><br />


    <asp:GridView ID="GridView1" runat="server" Visible="false" BackColor="White" 
                                    Width="100%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="0px" 
                                    CellPadding="10" padding="2px" ForeColor="#333333" GridLines="None" ShowFooter="True" 
                                    HorizontalAlign="Center" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" EmptyDataText="You have not booked any asset yet." DataKeyNames="ID">
                 <AlternatingRowStyle BackColor="#f1f1f1" />

                 <Columns>
                     <asp:TemplateField ShowHeader="False">
                         
                         <ItemTemplate>
                             <asp:CheckBox ID="CheckBoxdelete" runat="server" />
                         </ItemTemplate>
                         
                     </asp:TemplateField>
                     
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

    <asp:GridView ID="GridView2" Visible="false" runat="server" BackColor="White" 
                                    Width="100%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="0px" 
                                    CellPadding="10" padding="2px" ForeColor="#333333" GridLines="None" ShowFooter="True" 
                                    HorizontalAlign="Center" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" EmptyDataText="You have not booked any asset yet." DataKeyNames="ID">
                 <AlternatingRowStyle BackColor="#f1f1f1" />

                 <Columns>
                     <asp:TemplateField ShowHeader="False">
                         
                         <ItemTemplate>
                             <asp:CheckBox ID="CheckBox" runat="server" />
                         </ItemTemplate>
                         
                     </asp:TemplateField>
                     
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
                   <asp:Button ID="LinkButton2" runat="server" CssClass="deleteBooking"  CausesValidation="False" CommandName="Delete" Text="Cancel Booking" OnClick="LinkButton2_Click" OnClientClick="return confirm('Are you sure you want to delete this booking?');"></asp:Button>

   

</asp:Content>
