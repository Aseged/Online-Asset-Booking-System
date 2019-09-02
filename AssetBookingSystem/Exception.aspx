<%@ Page Title="" Language="C#" MasterPageFile="~/system.Master" AutoEventWireup="true" CodeBehind="Exception.aspx.cs" Inherits="AssetBookingSystem.Exception" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="confirmText" style=" background-color:#fffbec; height:1%; width:50%;  
 border-top: 1px solid red; border-bottom: 1px solid red;border-radius:8px; padding:2px;
 font-family: Track, Georgia, Times, serif; 
				text-decoration: none;
				font-size:12px;
				text-align:center;
				color:#999999;
                margin:0 auto 0 auto;">
        <img style="margin-top:40px; margin-bottom:20px;" src="Image/exclamation.png" /> <br />
        <br /><asp:Label ID="exceptionHandle" runat="server" Visible="true" ForeColor="Red" Text="Ooops, something went wrong! <br/> <br/>Your booking is complete, but we were unable to send you a confirmation e-mail.<br/> <br/>Contact IT Support to request booking confirmation."></asp:Label><br /><br />
        <br /><br />
                       <asp:Button ID="CancelInsert" CssClass="CancelInsert" OnClick="goBack_Click" runat="server" Text="OK, go to home" />
    <br /><br /></div><br /><br />

</asp:Content>
