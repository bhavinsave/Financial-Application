<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Exp_Details.aspx.cs" Inherits="Exp_Details" %>

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
                    Expense Category</td>
                <td style="width: 100px">
                    Category Details</td>
                <td style="width: 100px">
                    Amount</td>
                <td style="width: 100px">
                    Ideal Amount</td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Food</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Travel</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Clothes</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Rent</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Fees</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Bill</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Misc</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save Expense" />&nbsp;<asp:Button
            ID="Button2" runat="server" OnClick="Button2_Click" Text="Print Report" /><br />
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Navy"></asp:Label><br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
        |
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Personal_Inf.aspx" Visible="False">Continue</asp:HyperLink><br />
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
