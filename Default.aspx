<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmployeeInformation._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <div>
       <div style="font-size:x-large" align="center">Employee Information</div>
   </div>
    <table class="w-100">
         <tr>
     <td style="width: 472px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Employee ID &nbsp;</td>
     <td style="width: 634px">
         <asp:TextBox ID="txtEmpID" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Get" BackColor="#CC9900" Font-Bold="True" style="margin-left: 42" Width="108px" />
         
     &nbsp;&nbsp;&nbsp;&nbsp;
                  
     </td>
     <td>&nbsp;</td>
 </tr>
       
        <tr>
            <td style="width: 472px; height: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Employee Name&nbsp;</td>
            <td style="width: 634px; height: 18px;">
                <asp:TextBox ID="TxtEmpName" runat="server"></asp:TextBox>
               </td>
            <td style="height: 18px"></td>
        </tr>
        <tr>
            <td style="width: 472px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Employee Email ID</td>
            <td style="width: 634px">
                <asp:TextBox ID="txtEmpEmailid" runat="server"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmpEmailid" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 472px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Employee Mobile Number</td>
            <td style="width: 634px">
                <asp:TextBox ID="TxtMobileNo" runat="server" type="number" DataFormatString="{0:dd-MM-yyyy}"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtMobileNo" ErrorMessage="Enter 10 digits Mobile Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 472px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Employee Date of Birth</td>
            <td style="width: 634px">
                <asp:TextBox ID="DatePickerTextBox" runat="server" type="date"></asp:TextBox>
               
                 <%--<asp:HiddenField id="LastMOD" runat="server" />
              --%>

            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 472px">&nbsp;</td>
            <td style="width: 634px">
                <asp:Button ID="btnInsert" runat="server" ForeColor="#000066" OnClick="Button1_Click" Text="Insert" BackColor="#339933" Font-Bold="True" />
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" BackColor="#FFFF66" Font-Bold="True" />
&nbsp;&nbsp;
                <asp:Button ID="BtnDelete" runat="server" OnClick="BtnDelete_Click" Text="Delete" BackColor="Red" Font-Bold="True" />
            &nbsp;
                <asp:Button ID="BtnSearch" runat="server" OnClick="BtnSearch_Click" Text="Search" BackColor="#3333FF" Font-Bold="True" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 472px; height: 50px;"></td>
            <td style="width: 634px; height: 50px;"></td>
            <td style="height: 50px"></td>
        </tr>
        <tr>
            <td style="width: 472px">&nbsp;</td>
            <td style="width: 634px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 472px">&nbsp;</td>
            <td style="width: 634px">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-top: 0px; margin-left: 0px;" Width="227px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField AccessibleHeaderText="Employee Name" />
                        <asp:BoundField AccessibleHeaderText="Employee Email ID" />
                        <asp:BoundField AccessibleHeaderText="Mobile Number" />
                        <asp:BoundField AccessibleHeaderText="Date of Birth" />
                        <asp:BoundField AccessibleHeaderText="Last Modified Date" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 472px">&nbsp;</td>
            <td style="width: 634px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 472px">&nbsp;</td>
            <td style="width: 634px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
</table>
    <br />

    
<link href="styles/jquery-ui.css" rel="stylesheet" />  
<script src="scripts/jquery-1.11.3.min.js"></script>  
<script src="scripts/jquery-ui.js"></script> 
 <script> 
       <%-- $(function () {
            $("#<%= DatePickerTextBox.ClientID %>").datepicker({
                 dateFormat: 'dd-mm-yyyy', // Set the date format
                 changeMonth: true,       // Allow changing of months
                 changeYear: true         // Allow changing of years
             });
         });--%>
</script>




</asp:Content>
