<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_User_Account.aspx.cs" Inherits="Admin_User_Account" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    
    <link rel="stylesheet" media="screen,projection" type="text/css" href="css/main.css" />
    <!--[if lte IE 6]><link rel="stylesheet" type="text/css" href="css/main-msie.css" /><![endif]-->
    <link rel="stylesheet" media="screen,projection" type="text/css" href="css/scheme.css" />
    <link rel="stylesheet" media="print" type="text/css" href="css/print.css" />

    <title>Financial Application</title>
</head>

<body>

<div id="main">

    <!-- Header -->
    <div id="header">

        <!-- Your logo -->
        <h1 id="logo"><a href="#"><span>Financial </span>Application</a></h1>
        <hr class="noscreen" />        

        <!-- Your slogan -->
        <div id="slogan">Grow your Money Here !!!</div>
        <hr class="noscreen" />        

    </div> <!-- /header -->

    <!-- Navigation -->
    <div id="nav">
    
        <ul class="box">
            <li><a href="Admin_Home.aspx">Home</a></li> <!-- Active page (highlighted) -->
            <li><a href="Admin_LRLR.aspx">LRLR Screener</a></li>
            <li id="nav-active"><a href="Admin_User_Account.aspx">User Account</a></li>
            <li><a href="Admin_Forum.aspx">Forum Status</a></li>
            <li><a href="Admin_CP.aspx">Change Password</a></li>
            <li><a href="Admin_Login.aspx">Logout</a></li>
        </ul>
        
    <hr class="noscreen" /> 
    </div> <!-- /nav -->
    <div id="cols" class="box">

        <!-- Content -->
        <div id="content">
        
            <h2 id="content-title">Welcome to Financial Application</h2>

            <hr class="noscreen" />
            
            <div id="content-in">
<form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td style="width: 100px">
                    Reg No</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox></td>
                <td rowspan="6" style="width: 275px">
                    </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Name</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Address</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox3" runat="server" Height="80px" ReadOnly="True" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Contact</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Email</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Account Status</td>
                <td style="width: 100px">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="80px">
                        <asp:ListItem>Off</asp:ListItem>
                        <asp:ListItem>On</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
        </table>
    
    </div>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update Status" /><br />
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label><br />
        <br />
        &nbsp;
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" EmptyDataText="No Record Found">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <Columns>
                <asp:BoundField DataField="U_No" HeaderText="U_No" SortExpression="U_No" />
                <asp:BoundField DataField="U_Name" HeaderText="U_Name" SortExpression="U_Name" />
                <asp:BoundField DataField="U_Address" HeaderText="U_Address" SortExpression="U_Address" />
                <asp:BoundField DataField="U_Contact" HeaderText="U_Contact" SortExpression="U_Contact" />
                <asp:BoundField DataField="U_Email" HeaderText="U_Email" SortExpression="U_Email" />
                <asp:BoundField DataField="U_Image" HeaderText="U_Image" SortExpression="U_Image" />
                <asp:BoundField DataField="A_Status" HeaderText="A_Status" SortExpression="A_Status" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KMSConnectionString %>"
            SelectCommand="SELECT [U_No], [U_Name], [U_Address], [U_Contact], [U_Email], [U_Image], [A_Status] FROM [User_Details]">
        </asp:SqlDataSource>
        <br />
        <br />
        <table>
            <tr>
                <td style="width: 100px">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>U_No</asp:ListItem>
                        <asp:ListItem>U_Name</asp:ListItem>
                        <asp:ListItem>U_Contact</asp:ListItem>
                        <asp:ListItem>U_Email</asp:ListItem>
                        <asp:ListItem>A_Status</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 181px">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6"
                        ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator></td>
                <td style="width: 100px">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Search" ValidationGroup="A" /></td>
                <td style="width: 100px">
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Show All" /></td>
            </tr>
        </table>
        <br />
        <br />
        
    </form>
            </div> <!-- /content-in -->
               
        </div> <!-- /content -->

        <hr class="noscreen" />

        <!-- Sidebar -->
        <div id="aside">
            
            <!-- News -->
            <h4 id="aside-title">Recent News</h4>
            
            <div class="aside-in">
                <div class="aside-box">

                    <dl id="news">
			<marquee direction="Up" scrolldelay="250">
                        <dt><a href="#">Sensex may fall further towards 18000 levels, say analysts</a></dt>
                        
                        <br>
                        <dt><a href="#">Early elections could provide needed impetus to markets: Pankaj Pandey, ICICIdirect.com</a></dt>
                        
                        <br>
                        <dt><a href="#">Weak job gains cast shadow on U.S. economic outlook</a></dt>

			<br>
			<dt><a href="#">Jefferies says Indian banks are 'going nowhere'</a></dt>

			<br>
			<dt><a href="#">BHEL FY13 provisional profit down 8 percent</a></dt>

			<br>
			<dt><a href="#">NSE's run for Investors in Delhi elicits strong interest</a></dt>

                        
			</marquee>
                    </dl>
                
                </div> <!-- /aside-box -->
            </div> <!-- /aside-in -->
          
            <!-- Contact -->
            <h4 class="title">Sponsored Ads</h4>

            <div class="aside-in">
                <div class="aside-box">
<marquee scrolldelay="200">
<img src="images/hdfc.gif" height="50"> &nbsp; <img src="images/icici_logo.jpg" height="50">
</marquee>

                </div> <!-- /aside-box -->
            </div> <!-- /aside-in -->
   
        </div> <!-- /aside -->
    
    </div> <!-- /cols -->
    
    <div id="cols-bottom"></div>

    <hr class="noscreen" />
    
    <!-- Footer -->
    <div id="footer">

         
        <p class="f-right">Site designed by : Anuj | Anirudh | Bhavin</p>
        
        <p>&copy;&nbsp;2013 Financial Application</p>

    </div> <!-- /footer -->

</div> <!-- /main -->

</body>
</html>
