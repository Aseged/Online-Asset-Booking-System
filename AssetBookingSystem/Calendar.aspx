<%@ Page Title="" Language="C#" MasterPageFile="~/system.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="AssetBookingSystem.Calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /> <br />
    <asp:Label ID="NoBooking" runat="server" CssClass="SameDayBooking" Visible="false" Text="No booking found for this date"></asp:Label>
    <div style="margin-left:100px; height:1%; width:1%; ">

       
     <asp:GridView ID="dayBookingDetails" runat="server" Visible="false"
        BackColor="White" Width="700px" HeaderStyle-BackColor="#d41b57" HeaderStyle-ForeColor="White" BorderWidth="0px" 
         HeaderStyle-BorderColor="DimGray" CellPadding="10" FooterStyle-BackColor="White"
          FooterStyle-BorderColor="#d41b57"
       ForeColor ="#333333" GridLines="None"
        ShowFooter="True" HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="ID" >
    <AlternatingRowStyle BackColor="#f1f1f1" />
         <Columns>
             <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
             <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
             <asp:BoundField DataField="StartDate" HeaderText="StartDate" ReadOnly="True" SortExpression="StartDate" />
             <asp:BoundField DataField="EndDate" HeaderText="EndDate" ReadOnly="True" SortExpression="EndDate" />
             <asp:BoundField DataField="StartTime" HeaderText="StartTime" ReadOnly="True" SortExpression="StartTime" />
             <asp:BoundField DataField="EndTime" HeaderText="EndTime" ReadOnly="True" SortExpression="EndTime" />
             <asp:BoundField DataField="Campus" HeaderText="Campus" SortExpression="Campus" />
             <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
         </Columns>

<FooterStyle BackColor="White" BorderColor="#D41B57"></FooterStyle>

<HeaderStyle BackColor="#D41B57" BorderColor="DimGray" ForeColor="White"></HeaderStyle>
       </asp:GridView> 
        <asp:Button ID="hideDetails" CssClass="hideDetails" runat="server" Text="Hide" Visible="false" OnClick="hideDetails_Click" />
       
       <asp:Calendar ID="CalendarView" runat="server" Visible="true" CssClass="calendarCSS" CellPadding="30" 
           OnDayRender="Calendar1_DayRender" BorderColor="White" CellSpacing="6" NextMonthText="&gt;" PrevMonthText="&lt;" OnSelectionChanged="CalendarView_SelectionChanged" ToolTip="Select a day to view Booking">
         <DayHeaderStyle HorizontalAlign="Left" />
         <OtherMonthDayStyle ForeColor="#999999" />
         <SelectedDayStyle BackColor="#D41B57" />
         <TitleStyle BackColor="White" Font-Bold="True" Font-Size="X-Large" />
         <TodayDayStyle BackColor="Silver" />
         <WeekendDayStyle BackColor="White" ForeColor="#999999" />
       </asp:Calendar>
</div>
</asp:Content>
