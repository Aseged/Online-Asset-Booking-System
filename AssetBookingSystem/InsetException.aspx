<%@ Page Title="" Language="C#" MasterPageFile="~/systemManage.Master" AutoEventWireup="true" CodeBehind="InsetException.aspx.cs" Inherits="AssetBookingSystem.InsetException" %>
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
        <br /><asp:Label ID="exceptionHandle" runat="server" Visible="true" ForeColor="Red" Text="Ooops, something went wrong! <br/> <br/>Unable to insert asset, please try again later<br/> <br/>Contact IT Support to request booking confirmation."></asp:Label><br /><br />
        </div><br /><br />
</asp:Content>
