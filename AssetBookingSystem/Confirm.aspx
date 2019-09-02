<%@ Page Title="" Language="C#" MasterPageFile="~/system.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="AssetBookingSystem.Confirm" %>
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
        <img style="margin-top:40px; margin-bottom:20px;" src="Image/DoneTick1.png" /> <br />
        
            Your booking is complete successfully. <br/>You will receive a confirmation e-mail shortly.<br />
        

       

    </div >
    
    <div style=" width:50%;  
 
 			
                margin:0 auto 0 auto;">
<asp:Button ID="confirmBook" CssClass="checkAvailable" runat="server" 
                                   Text="Book another asset" OnClick="confirmBook_Click" />
        <asp:Button ID="finishBook" CssClass="checkAvailable" runat="server" 
                                   Text="done" OnClick="finishBook_Click" />
 </div>

</asp:Content>
