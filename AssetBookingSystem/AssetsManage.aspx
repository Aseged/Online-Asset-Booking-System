<%@ Page Title="" Language="C#" MasterPageFile="~/systemManage.Master" AutoEventWireup="true" CodeBehind="AssetsManage.aspx.cs" Inherits="AssetBookingSystem.AssetsManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   
                    
            
    
   
                    
            <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                                    Width="100%" BorderColor="#999999" BorderStyle="Solid" BorderWidth="0px" 
                                    CellPadding="10" padding="2px" ForeColor="#333333" GridLines="None" ShowFooter="True" 
                                    OnRowCreated="RowCreated" HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="AssetID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                 <AlternatingRowStyle BackColor="#f1f1f1" />

                 <Columns>
                     
                     <asp:TemplateField>
                                
                                <FooterTemplate>
                                    
                                    <asp:Button ID="InsertNew" CssClass="buttonInsertNew" OnClick="InsertNew_Click" runat="server" Text="Insert New Asset" />
                                    <asp:Button ID="BookNow" CssClass="buttonBookNow" OnClick="BookNow_Click" runat="server" Text="Book Asset" />          
                                    
                        
                                </FooterTemplate>
                        </asp:TemplateField>
                     <asp:TemplateField ShowHeader="False">
                         <EditItemTemplate>
                             
                             <asp:LinkButton ID="LinkButton1" runat="server" CssClass="EditButtons"  CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                             <br>
                             </br>
                             <asp:LinkButton ID="LinkButton2" runat="server" CssClass="EditButtons" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        
                         </EditItemTemplate>

                         <ItemTemplate>
                             
                             <asp:LinkButton ID="LinkButton1" runat="server" CssClass="EditButtons" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                             <br>
                             </br>
                             <asp:LinkButton ID="LinkButton2" runat="server" CssClass="EditButtons" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this Asset?');"></asp:LinkButton>
                         
                                 </ItemTemplate>
                         <ControlStyle CssClass="EditButtons" ForeColor="White" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="ARNumber" SortExpression="ARNumber">
                         <EditItemTemplate>
                             <asp:TextBox ID="ARNumberText" runat="server" width="60px" CssClass="EditBox" Text='<%# Bind("ARNumber") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("ARNumber") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Asset" SortExpression="Asset">
                         <EditItemTemplate>
                             <asp:TextBox ID="AssetText" runat="server" CssClass="EditBox" Text='<%# Bind("Asset") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredAsset" runat="server" ControlToValidate="AssetText" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("Asset") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Descriptions" SortExpression="Descriptions">
                         <EditItemTemplate>
                             <asp:TextBox ID="DescriptionsText" runat="server" Width="160px"  CssClass="EditBox" Text ='<%# Bind("Descriptions") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredDescriptions" runat="server" ControlToValidate="DescriptionsText" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("Descriptions") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Campus" SortExpression="Campus">
                         <EditItemTemplate>
                             
                             <asp:DropDownList ID="CampusDrop" CssClass="EditBox" runat="server" Text='<%# Bind("Campus") %>'>
                                         <asp:ListItem Selected="True">Evesham</asp:ListItem>
                                         <asp:ListItem>Malvern</asp:ListItem>

                                     </asp:DropDownList>
                              <asp:RequiredFieldValidator ID="RequiredCampus" runat="server" ControlToValidate="CampusDrop" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label4" runat="server" Text='<%# Bind("Campus") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="ObtainMethod" SortExpression="ObtainMethod">
                         <EditItemTemplate>
                             
                             <asp:DropDownList ID="MethodDrop" CssClass="EditBox" runat="server" Text='<%# Bind("ObtainMethod") %>'  >
                                         <asp:ListItem Selected="True">Delivery</asp:ListItem>
                                         <asp:ListItem>Collection</asp:ListItem>

                                     </asp:DropDownList>
                              <asp:RequiredFieldValidator ID="RequiredMethod" runat="server" ControlToValidate="MethodDrop" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label5" runat="server" Text='<%# Bind("ObtainMethod") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:Image ID="Image1" runat="server" Width="70px" ImageUrl='<%# Bind("Images", "{0}") %>' />
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>

            </asp:GridView>

             
    
                               
                    
                    

            
                               
                    
                    
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AssetBookingSystemConnectionString %>" DeleteCommand="DELETE FROM [tblAssets] WHERE [AssetID] = @AssetID" InsertCommand="INSERT INTO [tblAssets] ([ARNumber], [Asset], [Images], [Descriptions], [Campus], [ObtainMethod], [TimeOfEntry]) VALUES (@ARNumber, @Asset, @Images, @Descriptions, @Campus, @ObtainMethod, @TimeOfEntry)" SelectCommand="SELECT * FROM [tblAssets]" UpdateCommand="UPDATE [tblAssets] SET [ARNumber] = @ARNumber, [Asset] = @Asset, [Images] = @Images, [Descriptions] = @Descriptions, [Campus] = @Campus, [ObtainMethod] = @ObtainMethod, [TimeOfEntry] = @TimeOfEntry WHERE [AssetID] = @AssetID">
                <DeleteParameters>
                    <asp:Parameter Name="AssetID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ARNumber" Type="String" />
                    <asp:Parameter Name="Asset" Type="String" />
                    <asp:Parameter Name="Images" Type="String" />
                    <asp:Parameter Name="Descriptions" Type="String" />
                    <asp:Parameter Name="Campus" Type="String" />
                    <asp:Parameter Name="ObtainMethod" Type="String" />
                    <asp:Parameter Name="TimeOfEntry" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ARNumber" Type="String"/> 
                    <asp:Parameter Name="Asset" Type="String" />
                    <asp:Parameter Name="Images" Type="String" />
                    <asp:Parameter Name="Descriptions" Type="String" />
                    <asp:Parameter Name="Campus" Type="String" />
                    <asp:Parameter Name="ObtainMethod" Type="String" />
                    <asp:Parameter Name="TimeOfEntry" Type="DateTime" />
                    <asp:Parameter Name="AssetID" Type="Int32" />
                </UpdateParameters>
                
            </asp:SqlDataSource>

             

                               
                    
                    

            
                               
                    
                    
            
        
</asp:Content>
