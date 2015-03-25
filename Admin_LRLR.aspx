<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_LRLR.aspx.cs" Inherits="Admin_LRLR" %>

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
            <li id="nav-active"><a href="Admin_LRLR.aspx">LRLR Screener</a></li>
            <li><a href="Admin_User_Account.aspx">User Account</a></li>
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
                    Type</td>
                <td style="width: 100px">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Bank FD</asp:ListItem>
                        <asp:ListItem>Corporate FD</asp:ListItem>
                        <asp:ListItem>PPF</asp:ListItem>
                        <asp:ListItem>KVP</asp:ListItem>
                        <asp:ListItem>Insurance</asp:ListItem>
                        <asp:ListItem>Debentures</asp:ListItem>
                        <asp:ListItem>Treasury Bills</asp:ListItem>
                        <asp:ListItem>Govt Securities</asp:ListItem>
                        <asp:ListItem>DEBT Funds</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Institution</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Interest Rate</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="10"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 21px">
                    Time Frame</td>
                <td style="width: 100px; height: 21px">
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="10"></asp:TextBox></td>
                <td style="width: 100px; height: 21px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Details</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="100" TextMode="MultiLine"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td style="width: 100px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Details" /></td>
                <td style="width: 102px">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Delete Details" /></td>
            </tr>
        </table>
        <br />
        <asp:Label ID="Label1" runat="server" ForeColor="#0000C0"></asp:Label><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None"
            BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1"
            EmptyDataText="No Record Found" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="IType" HeaderText="IType" SortExpression="IType" />
                <asp:BoundField DataField="Institution" HeaderText="Institution" SortExpression="Institution" />
                <asp:BoundField DataField="Interest_Rate" HeaderText="Interest_Rate" SortExpression="Interest_Rate" />
                <asp:BoundField DataField="Time_Frame" HeaderText="Time_Frame" SortExpression="Time_Frame" />
                <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
            </Columns>
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KMSConnectionString %>"
            SelectCommand="SELECT * FROM [LRLR_Details]"></asp:SqlDataSource>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin_Home.aspx">Home</asp:HyperLink></div>
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
