<%@ Page Title="" Language="C#" MasterPageFile="~/systemManage.Master" AutoEventWireup="true" CodeBehind="InsertNewAsset.aspx.cs" Inherits="AssetBookingSystem.InsertNewAsset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table id="NewAsset" class="style1" style="padding:20px 0 40px 200px; ">
                             <tr>

                                 <h2 style="text-align:center; font:bolder; font-size:large;">Insert New Asset</h2>
                             </tr>
        
                            <tr>
                                 <td align="right" class="style2">
                                      ARNumber

                                 </td>
                                 <td >
                                     
                                     
                                                               
                                     <asp:TextBox ID="TextARNumber" runat="server" Width="100%"  CssClass="EditBox" Text='<%# Bind("ARNumber") %>'></asp:TextBox>
                                     
                                     
                                                               
                                 </td>
                                 <td >
                                       
                                 </td>
                             </tr>



                             <tr>
                                 <td align="right" class="style2">
                                     Asset

                                 </td>
                                 <td >
                                     <asp:TextBox ID="TextAsset" runat="server" Width="100%"      CssClass="EditBox" Text='<%# Bind("Asset") %>'></asp:TextBox>
                                
                                      </td>
                                 <td >
                                                                   <asp:RequiredFieldValidator ID="RequiredAsset" runat="server" ControlToValidate="TextAsset" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>


                                 </td>
                             </tr>
        
         <tr>
                                 <td align="right" class="style2">
                                     Campus 

                                 </td>
                                 <td >
                                     
                                     <asp:DropDownList ID="CampusNew" CssClass="EditBox" Width="100%"  runat="server" Text='<%# Bind("Campus") %>'>
                                         <asp:ListItem></asp:ListItem>
                                         <asp:ListItem>Evesham</asp:ListItem>
                                         <asp:ListItem>Malvern</asp:ListItem>

                                     </asp:DropDownList>
                                     
                                 </td>

                                <td >
                              <asp:RequiredFieldValidator ID="RequiredCampus" runat="server" ControlToValidate="CampusNew" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                </td>
                                 
                                </tr>
                                <tr>
                                 <td align="right" class="style2">
                                     ObtainMethod 

                                 </td>
                                 <td >
                                     
                                     <asp:DropDownList ID="MethodNew" CssClass="EditBox" Width="100%"  runat="server" Text='<%# Bind("Campus") %>'>
                                         <asp:ListItem></asp:ListItem>
                                         <asp:ListItem>Delivery</asp:ListItem>
                                         <asp:ListItem>Collection</asp:ListItem>

                                     </asp:DropDownList>
                                     
                                 </td>

                                <td >
                              <asp:RequiredFieldValidator ID="RequiredMethod" runat="server" ControlToValidate="MethodNew" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                </td>
                                 
                                </tr>


<tr>
                                 <td align="right" class="style2">
                                     Descriptions 

                                 </td>
                                 <td class="style12">
                                     <asp:TextBox ID="TextDescriptions" Width="100%" Height="100px" runat="server" TextMode="MultiLine" CssClass="EditBox" Text='<%# Bind("Descriptions") %>'></asp:TextBox>
                                      </td>

                                <td >
                                <asp:RequiredFieldValidator ID="RequiredDescriptions" runat="server" ControlToValidate="TextDescriptions" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                </td>
                                 
    </tr>

                       
                             <tr>
                                 <td align="right" class="style2">
                                     Images 

                                 </td>
                                 <td class="style12">


                                     <asp:FileUpload ID="ImageUpload" runat="server" Width="100%"  CssClass="EditBox"/>
                                      </td>
                                 <td>
                                <asp:RequiredFieldValidator ID="ImageUploadValidator" runat="server" ControlToValidate="ImageUpload" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                 </td>

                          
                             </tr>  
        <tr>
            <td>

            </td>
            <td>
                         <asp:Label ID="uploadError" runat="server" Visible="true" Font-Size="Smaller" Text="File name must not already exists."></asp:Label><br />

            </td>
            <td>

            </td>
        </tr> 
                                  
                            <tr>

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

                   <asp:Button ID="CancelInsert" CssClass="CancelInsert"  CausesValidation="false" runat="server" Text="Cancel" OnClick="CancelInsert_Click" />
                                </td>
                            </tr>
            
                             
                             


                               





                                
                                
                                         
                            </table>  
</asp:Content>
