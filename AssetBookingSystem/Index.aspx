<%@ Page Title="Asset Booking" EnableEventValidation="false" Language="C#" MasterPageFile="~/system.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs"  Inherits="AssetBookingSystem.Index"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
                    <div id="formContainer">
                                
                        
    <table id="LocationTable" class="style1">
                             <tr>
                                 <td class="style2">
                                      Campus</td>
                                 <td class="style10">
                                     
                                     <div class="dropBox">
                                     <asp:DropDownList ID="CampusTextBox" cssClass="dropdownArrow1" runat="server" 
                                     Width="300px"
                                      Height="20px" BorderColor="#CCCCCC" align="right" BackColor="#FFFBEC" BorderWidth="1px" 
                                         BorderStyle="Solid" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="CampusTextBox_SelectedIndexChanged"  >
                                         
                                         
                                         <asp:ListItem></asp:ListItem>
                                         <asp:ListItem>Evesham</asp:ListItem>
                                         <asp:ListItem>Malvern</asp:ListItem>
                                   
                                     </asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredCampus" runat="server" ControlToValidate="CampusTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                         </div>                        
                                 </td>
                                 <td class="style9">
                                     
                                        
                                 </td>
                             </tr>
                             <tr>
                                 <td  class="style2">
                                     Room</td>
                                 <td class="style12">
                                     <asp:DropDownList ID="RoomTextBox" cssClass="dropdownArrow1" runat="server" 
                                     Width="300px" 
                                     Height="20px" BorderColor="#CCCCCC" BackColor="#FFFBEC" BorderWidth="1px" BorderStyle="Solid" AppendDataBoundItems="True" EnableViewState="False" DataSourceID="SqlDataSource1" DataTextField="Room" DataValueField="Room">
                                       
                                         
                                        <asp:ListItem></asp:ListItem>
                                       
                                         
                                         
                                     </asp:DropDownList>
                                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AssetBookingSystemConnectionString %>" SelectCommand="SELECT * FROM [tblROOMS] WHERE ([Campus] = @Campus)">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="CampusTextBox" Name="Campus" PropertyName="SelectedValue" Type="String" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                     <asp:RequiredFieldValidator ID="RequiredRoom" runat="server" ControlToValidate="RoomTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                 </td>
                                 <td class="style9">
                                     &nbsp;</td>
                             </tr>
                             <tr>
                                 <td  class="style2">
                                     Arrangement </td>
                                 <td class="style12">
                                     <asp:DropDownList ID="ArrangementTextBox" CssClass="dropdownArrow1" runat="server" Height="20px" Width="300px" 
                                        BorderColor="#cccccc" BackColor="#fffbec" BorderWidth="1px" BorderStyle="solid" AutoPostBack="true" OnSelectedIndexChanged="ArrangementTextBox_SelectedIndexChanged">
                                         <asp:ListItem></asp:ListItem>
                                         <asp:ListItem>Delivery</asp:ListItem>
                                         <asp:ListItem>Collection</asp:ListItem>

                                     </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredArrangement" runat="server" ControlToValidate="ArrangementTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                 </td>

                                <td class="style9"></td>
                                 
                             </tr>
                                         
                            </table>  
                                   


                        <table id="TimeTable" class="style1">
                             
                            
                            

                            <tr>
                                <td>

                                </td >
                                <td  class="style2">
                                    Start 
                                </td>
                                <td></td>

                                <td  class="style2">
                                    End 

                                </td>

                            </tr>
                            
                            <tr>
                                 <td  class="style2">
                                      Date and Time</td>
                                 <td class="style10">
                                     <asp:TextBox ID="StartDate" class="dropdownArrow1"  runat="server" 
                                     Width="200px" Height="20px" BorderColor="#cccccc" align="left" BackColor="#fffbec" 
                                     BorderWidth="1px" BorderStyle="solid" AutoPostBack="true" OnTextChanged="StartDate_TextChanged" ></asp:TextBox>

                                     
                                     <asp:Calendar ID="CalendarStartDate" runat="server" Visible="False"></asp:Calendar>
                                    <asp:RequiredFieldValidator ID="RequiredStartDate" runat="server" ControlToValidate="StartDate" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                     

                                </td>
                                     <td class="style10">
                                     <asp:DropDownList ID="StartTime" cssClass="dropdownArrow1" runat="server" 
                                     Width="70px"
                                      Height="20px" BorderColor="#cccccc" align="left" TextMode="MultiLine" BackColor="#fffbec" BorderWidth="1px" BorderStyle="solid" AutoPostBack="true" OnSelectedIndexChanged="StartTime_SelectedIndexChanged" >
                                         <asp:ListItem></asp:ListItem>
                                         <asp:ListItem>09:00</asp:ListItem>
                                         <asp:ListItem>09:15</asp:ListItem>
                                         <asp:ListItem>09:30</asp:ListItem>
                                         <asp:ListItem>09:45</asp:ListItem>
                                         <asp:ListItem>10:00</asp:ListItem>
                                         <asp:ListItem>10:15</asp:ListItem>
                                         <asp:ListItem>10:30</asp:ListItem>
                                         <asp:ListItem>10:45</asp:ListItem>
                                         <asp:ListItem>11:00</asp:ListItem>
                                         <asp:ListItem>11:15</asp:ListItem>
                                         <asp:ListItem>11:30</asp:ListItem>
                                         <asp:ListItem>11:45</asp:ListItem>
                                         <asp:ListItem>12:00</asp:ListItem>
                                         <asp:ListItem>12:15</asp:ListItem>
                                         <asp:ListItem>12:30</asp:ListItem>
                                         <asp:ListItem>12:45</asp:ListItem>
                                         <asp:ListItem>13:00</asp:ListItem>
                                         <asp:ListItem>13:15</asp:ListItem>
                                         <asp:ListItem>13:30</asp:ListItem>
                                         <asp:ListItem>13:45</asp:ListItem>
                                         <asp:ListItem>14:00</asp:ListItem>
                                         <asp:ListItem>14:15</asp:ListItem>
                                         <asp:ListItem>14:30</asp:ListItem>
                                         <asp:ListItem>14:45</asp:ListItem>
                                         <asp:ListItem>15:00</asp:ListItem>
                                         <asp:ListItem>15:15</asp:ListItem>
                                         <asp:ListItem>15:30</asp:ListItem>
                                         <asp:ListItem>15:45</asp:ListItem>
                                         <asp:ListItem>16:00</asp:ListItem>
                                         <asp:ListItem>16:15</asp:ListItem>
                                         <asp:ListItem>16:30</asp:ListItem>
                                         <asp:ListItem>16:45</asp:ListItem>
                                         <asp:ListItem>17:00</asp:ListItem>
                                         <asp:ListItem>17:15</asp:ListItem>
                                         <asp:ListItem>17:00</asp:ListItem>
                                         <asp:ListItem>17:45</asp:ListItem>
                                         <asp:ListItem>18:00</asp:ListItem>
                                         <asp:ListItem>18:15</asp:ListItem>
                                         <asp:ListItem>18:30</asp:ListItem>
                                         <asp:ListItem>18:45</asp:ListItem>
                                         <asp:ListItem>19:00</asp:ListItem>
                                         <asp:ListItem>19:15</asp:ListItem>
                                         <asp:ListItem>19:30</asp:ListItem>
                                         <asp:ListItem>19:45</asp:ListItem>
                                         <asp:ListItem>20:00</asp:ListItem>
                                         <asp:ListItem>20:15</asp:ListItem>
                                         <asp:ListItem>20:00</asp:ListItem>
                                         <asp:ListItem>20:45</asp:ListItem>
                                         <asp:ListItem>21:00</asp:ListItem>
                                         
                                        

                                     </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredStartTime" runat="server" ControlToValidate="StartTime" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </td> 

                                         <td class="style10">
                                     <asp:TextBox ID="FinishDate" class="dropdownArrow2"  runat="server" 
                                     Width="200px" Height="20px" BorderColor="#cccccc" align="right"  BackColor="#fffbec" 
                                         BorderWidth="1px" BorderStyle="solid" AutoPostBack="true" OnTextChanged="FinishDate_TextChanged" ></asp:TextBox>   

                                     
                                             <asp:Calendar ID="CalendarFinishDate" runat="server" Visible="False"></asp:Calendar>
                                    <asp:RequiredFieldValidator ID="RequiredFinishDate" runat="server" ControlToValidate="FinishDate" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                      </td>
                                             <td class="style10">
                                     <asp:DropDownList ID="FinishTime" cssClass="dropdownArrow1" runat="server" 
                                     Width="70px"
                                      Height="20px" BorderColor="#cccccc" TextMode="MultiLine" align="right" BackColor="#fffbec" BorderWidth="1px" BorderStyle="solid" AutoPostBack="true" OnSelectedIndexChanged="FinishTime_SelectedIndexChanged" >
                                         
                                         <asp:ListItem></asp:ListItem>
                                         <asp:ListItem>09:00</asp:ListItem>
                                         <asp:ListItem>09:15</asp:ListItem>
                                         <asp:ListItem>09:30</asp:ListItem>
                                         <asp:ListItem>09:45</asp:ListItem>
                                         <asp:ListItem>10:00</asp:ListItem>
                                         <asp:ListItem>10:15</asp:ListItem>
                                         <asp:ListItem>10:30</asp:ListItem>
                                         <asp:ListItem>10:45</asp:ListItem>
                                         <asp:ListItem>11:00</asp:ListItem>
                                         <asp:ListItem>11:15</asp:ListItem>
                                         <asp:ListItem>11:30</asp:ListItem>
                                         <asp:ListItem>11:45</asp:ListItem>
                                         <asp:ListItem>12:00</asp:ListItem>
                                         <asp:ListItem>12:15</asp:ListItem>
                                         <asp:ListItem>12:30</asp:ListItem>
                                         <asp:ListItem>12:45</asp:ListItem>
                                         <asp:ListItem>13:00</asp:ListItem>
                                         <asp:ListItem>13:15</asp:ListItem>
                                         <asp:ListItem>13:30</asp:ListItem>
                                         <asp:ListItem>13:45</asp:ListItem>
                                         <asp:ListItem>14:00</asp:ListItem>
                                         <asp:ListItem>14:15</asp:ListItem>
                                         <asp:ListItem>14:30</asp:ListItem>
                                         <asp:ListItem>14:45</asp:ListItem>
                                         <asp:ListItem>15:00</asp:ListItem>
                                         <asp:ListItem>15:15</asp:ListItem>
                                         <asp:ListItem>15:30</asp:ListItem>
                                         <asp:ListItem>15:45</asp:ListItem>
                                         <asp:ListItem>16:00</asp:ListItem>
                                         <asp:ListItem>16:15</asp:ListItem>
                                         <asp:ListItem>16:30</asp:ListItem>
                                         <asp:ListItem>16:45</asp:ListItem>
                                         <asp:ListItem>17:00</asp:ListItem>
                                         <asp:ListItem>17:15</asp:ListItem>
                                         <asp:ListItem>17:00</asp:ListItem>
                                         <asp:ListItem>17:45</asp:ListItem>
                                         <asp:ListItem>18:00</asp:ListItem>
                                         <asp:ListItem>18:15</asp:ListItem>
                                         <asp:ListItem>18:30</asp:ListItem>
                                         <asp:ListItem>18:45</asp:ListItem>
                                         <asp:ListItem>19:00</asp:ListItem>
                                         <asp:ListItem>19:15</asp:ListItem>
                                         <asp:ListItem>19:30</asp:ListItem>
                                         <asp:ListItem>19:45</asp:ListItem>
                                         <asp:ListItem>20:00</asp:ListItem>
                                         <asp:ListItem>20:15</asp:ListItem>
                                         <asp:ListItem>20:00</asp:ListItem>
                                         <asp:ListItem>20:45</asp:ListItem>
                                         <asp:ListItem>21:00</asp:ListItem>
                                     </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFinishTime" runat="server" ControlToValidate="FinishTime" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>


                                                                
                                 </td>
                                 <td class="style9">
                                   
  
                                      </td>   
                                
                        
                                 
                             </tr>
                              
                        
                        </table> 
         <br /> <br /><asp:Label ID="SameDayBooking" CssClass="SameDayBooking" runat="server" Visible="false" Text="Delivery service for same day booking is not available. Collection Only."></asp:Label> 
        <br /><br /> <br /><asp:Label ID="timeError" CssClass="SameDayBooking" runat="server" Visible="false" Text="Your specified booking time is invalid, please check again!"></asp:Label> 
               
                      
                            
                             <table id="Comment" class="style1">

                    
                                 <td align="right" class="style2">
                                     Your Message</td>
                                 <td class="style12">
                                     
                                     <asp:TextBox ID="MessageTextBox" CssClass="dropdownArrow1" runat="server" Height="100px" Width="380px"  
                                         TextMode="MultiLine" BorderColor="#cccccc" BackColor="#fffbec" BorderWidth="1px" BorderStyle="solid"></asp:TextBox>
                                 </td>
                             
                             
                             </table>      
                               <!--  side numbers -->    
                               <asp:Button ID="CheckAvailability" CssClass="checkAvailable" runat="server" 
                                   Text="Check Available asset" OnClick="CheckAvailability_Click"/>
           <br /><asp:Label ID="LabelRefresh" CssClass="buttonUpdateResult" runat="server" Visible="false" Text="Changed something? Click on the button to update search result."></asp:Label><br /> <br /><br />
                  
                          
                   
                            </div> 
                          <div id="inlineWrapper">
                                <div id="Div1">1</div>
                                <div id="Div2">2</div>
                                <div id="Div3">3</div>
                                <div id="Div4">4</div>
                        </div>
                            
               
                
                

                <div class="containers" id="about"></div>
                   
                  
                 
                     <br /><asp:Label ID="ConfirmError" CssClass="SameDayBooking" runat="server" Visible="false" Text="No choise has been made. Please choose your assets before confirming."></asp:Label> 


                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" 
                                    Width="700px" BorderColor="#999999" BorderStyle="Solid" BorderWidth="0px" 
                                    CellPadding="16" DataSourceID="SqlDataSource2"  ForeColor ="#333333" GridLines="None"
                                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowFooter="True" 
                                    OnRowCreated="RowCreated" HorizontalAlign="Center" Visible="False" DataKeyNames="AssetID" >
                        <AlternatingRowStyle BackColor="#f1f1f1" />
                        <Columns>
                           <asp:TemplateField>                             
                                
                                <FooterTemplate>
                                    
                                    <asp:Button ID="Confirm" CssClass="buttonConfirm" runat="server" Text="Confirm" Visible="True" OnClick="Confirm_Click"/>
                                   <asp:Button ID="Cancel" CssClass="buttonCancel" runat="server" Text="Cancel"  Visible="True" OnClick="Cancel_Click" />          
                                    
                        
                                </FooterTemplate>
                                
                                <ItemTemplate>
                                    
                                    <asp:CheckBox ID="CheckBox1" runat="server" Visible="true" />
                                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Unavailable" Visible="false" ></asp:Label>
                                
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="AssetID" HeaderText="AssetID" SortExpression="AssetID" Visible="true" />
                            <asp:BoundField DataField="Asset" HeaderText="Asset" SortExpression="Asset" />
                            <asp:BoundField DataField="Descriptions" HeaderText="Descriptions" SortExpression="Descriptions" />
                            <asp:BoundField DataField="ObtainMethod" HeaderText="ObtainMethod" SortExpression="ObtainMethod" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image style="" AlternateText="Image Not Found"  ID ="Image1" Width="60px" runat="server" ImageUrl='<%# Bind("Images") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        
                        <EmptyDataRowStyle ForeColor="red" HorizontalAlign="Center"/>
                        <FooterStyle BackColor="#ffffff" Width="100%" Height="100%"/> 
                        <HeaderStyle BackColor="white"  ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />

                    </asp:GridView>


                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AssetBookingSystemConnectionString %>" SelectCommand="SELECT * FROM [tblAssets] WHERE ([Campus] = @Campus) AND ([ObtainMethod] = @Arrangement)">
                    <SelectParameters>
                            <asp:ControlParameter ControlID="CampusTextBox" Name="Campus" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ArrangementTextBox" Name="Arrangement" PropertyName="SelectedValue" />
                        </SelectParameters>

                    </asp:SqlDataSource>

     <asp:GridView ID="GridView2" runat="server"
        BackColor="White" Width="700px" HeaderStyle-BackColor="#d41b57" HeaderStyle-ForeColor="White" BorderWidth="0px" 
         HeaderStyle-BorderColor="DimGray" CellPadding="10" FooterStyle-BackColor="White"
          FooterStyle-BorderColor="#d41b57"
       ForeColor ="#333333" GridLines="None" ShowHeader="true"
        ShowFooter="True" HorizontalAlign="Center" Visible="true" >
    <AlternatingRowStyle BackColor="#f1f1f1" /></asp:GridView> 

    <asp:GridView ID="GridView3" runat="server"
        BackColor="White" Width="700px" HeaderStyle-BackColor="#d41b57" HeaderStyle-ForeColor="White" BorderWidth="0px" 
         HeaderStyle-BorderColor="DimGray" CellPadding="10" FooterStyle-BackColor="White"
          FooterStyle-BorderColor="#d41b57"
       ForeColor ="#333333" GridLines="None" ShowHeader="true"
        ShowFooter="True" HorizontalAlign="Center" Visible="true" >
    <AlternatingRowStyle BackColor="#f1f1f1" /></asp:GridView> 



    

   </asp:Content>
