<%@ Page Title="" Language="C#" MasterPageFile="~/systemManage.Master" AutoEventWireup="true" CodeBehind="addROOM.aspx.cs" Inherits="AssetBookingSystem.addROOM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table id="NewAsset" class="style1" style="padding:20px 0 40px 200px; ">
                             <tr>

                                 <h2 style="text-align:center; font:bolder; font-size:large;">Insert New Room</h2>
                             </tr>
        
                             <tr style="align-content:center">
                                 <td class="style2">
                                     Room

                                 </td>
                                 <td >
                                     <asp:TextBox ID="TextNewRoom" runat="server" Width="300px"      CssClass="EditBox"> </asp:TextBox>
                                
                                      </td>
                                 <td >
                               <asp:RequiredFieldValidator ID="RequiredAsset" runat="server" ControlToValidate="TextNewRoom" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>


                                 </td>
                             </tr>
        
         <tr style="align-content:center">
                                 <td class="style2">
                                     Campus 

                                 </td>
                                 <td >
                                     
                                     <asp:DropDownList ID="CampusNew" CssClass="EditBox" Width="300px"  runat="server" >
                                         <asp:ListItem Selected="True"></asp:ListItem>
                                         <asp:ListItem>Evesham</asp:ListItem>
                                         <asp:ListItem>Malvern</asp:ListItem>

                                     </asp:DropDownList>
                                     
                                 </td>

                                <td >
                              <asp:RequiredFieldValidator ID="RequiredCampus" runat="server" ControlToValidate="CampusNew" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                </td>
                                 
                                </tr>
                            <tr style="align-content:center">

                                <td>

                                </td>
                                <td>
                    <asp:Button ID="ConfirmInsert" CssClass="ConfirmInsert" runat="server" Text="Insert "  OnClick="ConfirmInsert_Click" />
                   
                                </td>
                                <td>

                                </td>

                            </tr>
        

                                  
                            <tr>

                                <td>

                                </td>
                                
                                <td>

                   <asp:Button ID="CancelInsert" CssClass="CancelInsert" CausesValidation="false" runat="server" Text="Cancel" OnClick="CancelInsert_Click" />
                                </td>
                            </tr>
            
                                         
                            </table>  
</asp:Content>
