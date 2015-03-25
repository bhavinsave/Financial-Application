<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Growth.aspx.cs" Inherits="Growth" %>

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
    <div>
        <table>
            <tr>
                <td style="width: 100px">
                    Investment Category</td>
                <td style="width: 100px">
                    % to Invest</td>
                <td style="width: 100px">
                    Expected Return</td>
                <td style="width: 100px">
                    Returns</td>
            </tr>
            <tr>
                <td style="width: 100px">
                    LRLR</td>
                <td style="width: 100px">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="85px">
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>60</asp:ListItem>
                        <asp:ListItem>70</asp:ListItem>
                        <asp:ListItem>80</asp:ListItem>
                        <asp:ListItem>90</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px">
                    13%</td>
                <td style="width: 100px">
                    <asp:Label ID="Label1" runat="server" Text="0"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    MRMR</td>
                <td style="width: 100px">
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="85px">
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>60</asp:ListItem>
                        <asp:ListItem>70</asp:ListItem>
                        <asp:ListItem>80</asp:ListItem>
                        <asp:ListItem>90</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px">
                    20%</td>
                <td style="width: 100px">
                    <asp:Label ID="Label2" runat="server" Text="0"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    HRHR</td>
                <td style="width: 100px">
                    <asp:DropDownList ID="DropDownList3" runat="server" Width="85px">
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>60</asp:ListItem>
                        <asp:ListItem>70</asp:ListItem>
                        <asp:ListItem>80</asp:ListItem>
                        <asp:ListItem>90</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px">
                    50%</td>
                <td style="width: 100px">
                    <asp:Label ID="Label3" runat="server" Text="0"></asp:Label></td>
            </tr>
        </table>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Calculate" /><br />
        <br />
        <asp:Label ID="Label4" runat="server" ForeColor="Green"></asp:Label><br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink></div>

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
