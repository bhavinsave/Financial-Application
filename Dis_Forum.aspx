<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dis_Forum.aspx.cs" Inherits="Dis_Forum" %>

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
            <li id="nav-active"><a href="Dis_Forum.aspx">Discussion Forums</a></li>
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
    <div>
        New Forum<br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="152px" MaxLength="200" TextMode="MultiLine"
            Width="336px"></asp:TextBox><br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create Forum" /><br />
        <br />
        <asp:Label ID="Label1" runat="server" ForeColor="#0000C0"></asp:Label><br />
        <br />
        (Select to view replies)<br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            Width="616px" EmptyDataText="No Record Found">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <Columns>
                <asp:BoundField DataField="D_No" HeaderText="D_No" SortExpression="D_No" />
                <asp:BoundField DataField="U_No" HeaderText="U_No" SortExpression="U_No" />
                <asp:BoundField DataField="D_Date" HeaderText="D_Date" SortExpression="D_Date" />
                <asp:BoundField DataField="D_Data" HeaderText="D_Data" SortExpression="D_Data" />
                <asp:BoundField DataField="D_Status" HeaderText="D_Status" SortExpression="D_Status" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KMSConnectionString %>"
            SelectCommand="SELECT * FROM [Discuss_Forum]"></asp:SqlDataSource>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink><br />
        
</div>
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
