<%@ Page Title="" Language="C#" MasterPageFile="~/logIn.Master" AutoEventWireup="true" CodeBehind="Logon.aspx.cs" Inherits="AssetBookingSystem.LogIn" %>
<%@ Import Namespace="FormsAuth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <p style="text-align:center; font:bolder; font-size:medium;">Log into your college user account</p>--%>
    <table id="NewAsset" class="style1" style="padding:20px 0 40px 200px; ">
             
                            <tr>
                                <td>

                                </td>
                                <td>
                                    <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Red" Text="Log in failed, please try agian."></asp:Label><br />
                                    <asp:Label ID="lblStudentlogError" runat="server" Visible="false" ForeColor="Red" Text="You must be a member of staff."></asp:Label>
                            </td>
                                <td>

                                </td>
                            </tr>
        <tr>
                                 <td  class="style2">
                                      Campus</td>
                                 <td class="style10">
                                     
                                    
                                     <asp:DropDownList ID="txtCampus"  runat="server" Width="300px"
                                     BorderColor="#CCCCCC" align="right" BackColor="#FFFBEC" BorderWidth="1px" 
                                         BorderStyle="Solid" AutoPostBack="True" AppendDataBoundItems="True">
                                         
                                         <asp:ListItem></asp:ListItem>
                                         <asp:ListItem>Evesham</asp:ListItem>
                                         <asp:ListItem>Malvern</asp:ListItem>
                                    </asp:DropDownList>
                                 </td>
                                 <td>
                                     
                                         <asp:RequiredFieldValidator ID="RequiredCampus" runat="server" ControlToValidate="txtCampus" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                        
                                 </td>
                             </tr>
        
        <tr>
                                 <td  class="style2">
                                      User Name

                                 </td>
                                 <td class="style10">
                                     
                                     <asp:TextBox ID="TextUserName" runat="server" Width="300px"  CssClass="EditBox" Text='<%# Bind("ARNumber") %>'></asp:TextBox>
                                </td>
                                <td>
                                     <asp:RequiredFieldValidator ID="RequiredARNumber" runat="server" ControlToValidate="TextUserName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                     
                                     
                                                               
                                 </td>
                                 
                             </tr>



                             <tr>
                                 <td class="style2">
                                     Password

                                 </td>
                                 <td class="style12">
                                     <asp:TextBox ID="TextPassword" runat="server" Width="300px" TextMode="Password"      CssClass="EditBox"> </asp:TextBox>
                                </td>
                                 <td>
                                     <asp:RequiredFieldValidator ID="RequiredAsset" runat="server" ControlToValidate="TextPassword" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                
                                      </td>
                                 
                             </tr>
                                  
                            <tr>

                                <td>

                                </td>
                                <td>
                    <asp:Button ID="ConfirmInsert" CssClass="ConfirmInsert" runat="server" Text="Log In " OnClick="ConfirmInsert_Click" />
                   
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
