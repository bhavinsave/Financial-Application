<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MF_Screener.aspx.cs" Inherits="MF_Screener" %>

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
            <li><a href="Home.aspx">Home</a></li> <!-- Active page (highlighted) -->
            <li><a href="Dis_Forum.aspx">Discussion Forums</a></li>
            <li><a href="Change_Password.aspx">Change Password</a></li>
            <li><a href="index.aspx">Logout</a></li>
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
    <table>
        <tr>
            <td style="width: 100px">
                Scheme Name</td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 100px">
                Amount</td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" ValidationGroup="A" /><br />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label><br />

    <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>---Select---</asp:ListItem>
            <asp:ListItem>30 Days High</asp:ListItem>
            <asp:ListItem>30 Days Low</asp:ListItem>
            <asp:ListItem>52 Week High</asp:ListItem>
            <asp:ListItem>52 Week Low</asp:ListItem>
        </asp:DropDownList>&nbsp;<br />
        <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC"
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2"
        DataSourceID="SqlDataSource1" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="871px">
        <FooterStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="MF_House" HeaderText="MF_House" SortExpression="MF_House" />
            <asp:BoundField DataField="SCode" HeaderText="SCode" SortExpression="SCode" />
            <asp:BoundField DataField="Div_Growth" HeaderText="Div_Growth" SortExpression="Div_Growth" />
            <asp:BoundField DataField="ReInvest" HeaderText="ReInvest" SortExpression="ReInvest" />
            <asp:BoundField DataField="SName" HeaderText="SName" SortExpression="SName" />
            <asp:BoundField DataField="NAV" HeaderText="NAV" SortExpression="NAV" />
            <asp:BoundField DataField="Repurchase" HeaderText="Repurchase" SortExpression="Repurchase" />
            <asp:BoundField DataField="Sale" HeaderText="Sale" SortExpression="Sale" />
        </Columns>
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Left" BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KMSConnectionString %>"
        SelectCommand="SELECT * FROM [MF_Temp]"></asp:SqlDataSource>
        <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
        
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
<marquee direction="Up" marquee scrolldelay="200">
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
