<%@ Page Title="" Language="C#" MasterPageFile="~/systemManage.Master" AutoEventWireup="true" CodeBehind="insertROOMsException.aspx.cs" Inherits="AssetBookingSystem.insertROOMsException" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="failText" style=" background-color:#fffbec; height:1%; width:50%;  
 border-top: 1px solid red; border-bottom: 1px solid red;border-radius:8px; padding:2px;
 font-family: Track, Georgia, Times, serif; 
				text-decoration: none;
				font-size:12px;
				text-align:center;
				color:#999999;
                margin:0 auto 0 auto;">
        <img style="margin-top:40px; margin-bottom:20px;" src="Image/exclamation.png" /> <br />
        <br /><asp:Label ID="exceptionHandle" runat="server" Visible="true" ForeColor="Red" Text="Ooops, sorry! <br/> <br/>The new room you are trying to insert already exists.<br/> <br/>Either delete the exsisting room first, or try a different room name. "></asp:Label><br /><br />
        <br /><br />
                       <asp:Button ID="CancelInsert" CssClass="CancelInsert" OnClick="goBack_Click" runat="server" Text="OK, go back" />
    <br /><br /></div><br /><br />
</asp:Content>
