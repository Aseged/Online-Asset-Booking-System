<%@ Page Title="" Language="C#" MasterPageFile="~/logIn.Master" AutoEventWireup="true" CodeBehind="StudentLogInAttempt.aspx.cs" Inherits="AssetBookingSystem.StudentLogInAttempt" %>
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
        <img style="margin-top:40px; margin-bottom:20px;" src="Image/NotAllowed.png" /> <br />
           <br /><br /><p style="color:red;"> Sorry, this area is for staff only. <br/>If you feel you should have access to this area, please contact IT support for help.<br /></p>
        
<div style=" width:50%;  margin:0 auto 0 auto;">
        <asp:Button ID="finishBook" CssClass="checkAvailable" runat="server" 
                                   Text="ok" OnClick="finishBook_Click" />
 </div>
       

    </div ><br /><br />
</asp:Content>
