<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="User_Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Code Developed by Mrudang Mathuria -->

<head>

<title>BoostYourEarning.Com</title>


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
<meta name="description" content="Boost Your Earning website" />
<meta name="keywords" content="Boost Your Earning products names"/>
<meta name="copyright" content="Boost Your Earning "/>
<meta name="robots" content="all" />

<script type="text/javascript">
	var banner_delay = 6000;
</script> 


<link rel="icon" type="image/png" href="favicon.png" />


<!-- including css styles -->



<style type="text/css">
body {
	background: #0F0D0D;
	padding: 30px 0 0 50px;
}
div.sc_menu_wrapper {
	position: relative; 	
	height: 290px;
	/* Make bigger than a photo, because we need a place for a scrollbar. */
	width: 264px;
	
	margin-top: 1px;
	overflow: auto;
}
div.sc_menu {
	padding: 15px 0;
}
.sc_menu a {
	display: block;
	margin-bottom: 5px;
	width: 272px;
	
	border: 2px rgb(79, 79, 79) solid;
    -webkit-border-radius: 10px;
    -moz-border-radius: 1px;		
	
	/* When image support is turned off */
	color: #fff;
	background: rgb(79, 79, 79);	
}
.sc_menu a:hover {
	border-color: rgb(130, 130, 130);

}
.sc_menu img {
	display: block;
	border: none;
}

.sc_menu_wrapper .loading {
	position: absolute;
	top: 50px;
	left: 10px;
	
	margin: 0 auto;
	padding: 10px;

	width: 100px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;	
	
	text-align: center;
	color: #fff;
	border: 1px solid rgb(79, 79, 79);
	background: #1F1D1D;
}
/* Styling tooltip */
.sc_menu_tooltip {
	display: block;
	position: absolute;
	
	padding: 6px;
	font-size: 12px;	
	color: #fff;
	
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;	
	
	border: 1px solid rgb(79, 79, 79);
	background: rgb(0, 0, 0);
	/* Make background a bit transparent for browsers that support rgba */	
	background: rgba(0, 0, 0, 0.5);
}

/* Here are styles for a link to an article. Not for you :) */
#back {
	margin-left: 8px;
	color: gray;
	font-size: 18px;
	text-decoration: none;
}
#back:hover {
	text-decoration: underline;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js" type="text/javascript"></script>
<script type= "text/javascript">/*<![CDATA[*/

function makeScrollable(wrapper, scrollable){
	// Get jQuery elements
	var wrapper = $(wrapper), scrollable = $(scrollable);
	
	// Hide images until they are not loaded
	scrollable.hide();
	var loading = $('<div class="loading">Loading...</div>').appendTo(wrapper);
	
	// Set function that will check if all images are loaded
	var interval = setInterval(function(){
		var images = scrollable.find('img');
		var completed = 0;
		
		// Counts number of images that are succesfully loaded
		images.each(function(){
			if (this.complete) completed++;	
		});
		
		if (completed == images.length){
			clearInterval(interval);
			// Timeout added to fix problem with Chrome
			setTimeout(function(){
				
				loading.hide();
				// Remove scrollbars	
				wrapper.css({overflow: 'hidden'});						
				
				scrollable.slideDown('slow', function(){
					enable();	
				});					
			}, 1000);	
		}
	}, 100);
	
	function enable(){
		// height of area at the top at bottom, that don't respond to mousemove
		var inactiveMargin = 99;					
		// Cache for performance
		var wrapperWidth = wrapper.width();
		var wrapperHeight = wrapper.height();
		// Using outer height to include padding too
		var scrollableHeight = scrollable.outerHeight() + 2*inactiveMargin;
		// Do not cache wrapperOffset, because it can change when user resizes window
		// We could use onresize event, but it's just not worth doing that 
		// var wrapperOffset = wrapper.offset();
		
		// Create a invisible tooltip
		var tooltip = $('<div class="sc_menu_tooltip"></div>')
			.css('opacity', 0)
			.appendTo(wrapper);
	
		// Save menu titles
		scrollable.find('a').each(function(){				
			$(this).data('tooltipText', this.title);				
		});
		
		// Remove default tooltip
		scrollable.find('a').removeAttr('title');		
		// Remove default tooltip in IE
		scrollable.find('img').removeAttr('alt');	
		
		var lastTarget;
		//When user move mouse over menu			
		wrapper.mousemove(function(e){
			// Save target
			lastTarget = e.target;

			var wrapperOffset = wrapper.offset();
		
			var tooltipLeft = e.pageX - wrapperOffset.left;
			// Do not let tooltip to move out of menu.
			// Because overflow is set to hidden, we will not be able too see it 
			tooltipLeft = Math.min(tooltipLeft, wrapperWidth - 75); //tooltip.outerWidth());
			
			var tooltipTop = e.pageY - wrapperOffset.top + wrapper.scrollTop() - 40;
			// Move tooltip under the mouse when we are in the higher part of the menu
			if (e.pageY - wrapperOffset.top < wrapperHeight/2){
				tooltipTop += 80;
			}				
			tooltip.css({top: tooltipTop, left: tooltipLeft});				
			
			// Scroll menu
			var top = (e.pageY -  wrapperOffset.top) * (scrollableHeight - wrapperHeight) / wrapperHeight - inactiveMargin;
			if (top < 0){
				top = 0;
			}			
			wrapper.scrollTop(top);
		});
		
		// Setting interval helps solving perfomance problems in IE
		var interval = setInterval(function(){
			if (!lastTarget) return;	
										
			var currentText = tooltip.text();
			
			if (lastTarget.nodeName == 'IMG'){					
				// We've attached data to a link, not image
				var newText = $(lastTarget).parent().data('tooltipText');

				// Show tooltip with the new text
				if (currentText != newText) {
					tooltip
						.stop(true)
						.css('opacity', 0)	
						.text(newText)
						.animate({opacity: 1}, 1000);
				}					
			}
		}, 200);
		
		// Hide tooltip when leaving menu
		wrapper.mouseleave(function(){
			lastTarget = false;
			tooltip.stop(true).css('opacity', 0).text('');
		});			
		
		/*
		//Usage of hover event resulted in performance problems
		scrollable.find('a').hover(function(){
			tooltip
				.stop()
				.css('opacity', 0)
				.text($(this).data('tooltipText'))
				.animate({opacity: 1}, 1000);
	
		}, function(){
			tooltip
				.stop()
				.animate({opacity: 0}, 300);
		});
		*/			
	}
}
	
$(function(){	
	makeScrollable("div.sc_menu_wrapper", "div.sc_menu");
});
/*]]>*/</script>










<link rel="stylesheet" type="text/css" href="style.css" />
<!--[if (gte IE 7)|(!IE)]><!-->
<link rel="stylesheet" type="text/css" href="menu.css" />
<!--<![endif]-->

<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="menuie6.css" />
<![endif]-->


<!-- including javascripts (jquery, swfObject, prettyPhoto) -->

<script type="text/javascript" src="js/jquery-1.4.min.js"></script>

<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/jquery.cycle.min.js"></script>
<script type="text/javascript" src="js/cufon.js"></script>
<script type="text/javascript" src="js/Century_Gothic_400.font.js"></script>
<script type="text/javascript" src="js/custom.js"></script> 
<script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>



<!--[if IE 6]>
	<script src="js/DD_belatedPNG_0.0.8a-min.js"></script>
	<script>
		DD_belatedPNG.fix('img, .menu_container, .main_menu li .hover, .main_menu li ul, #recentimages li, #recentimages li .hover, .left_shadow, .right_shadow, .container_left_shadow, .container_right_shadow, .submit_bg, .container_page_left_shadow, .container_page_right_shadow, .container_portfolio_left_shadow, .container_portfolio_right_shadow, .portfolio_zoom');
	</script>
<![endif]-->

</head>




<body>

<!-- begin header -->
<div id="header" >

	<!-- begin header background -->
	<div class="header_bg">
	
		<!-- begin header content -->
		<div class="header_container">
		<div class="header_content_topading"></div>
			<!-- begin main menu -->
			<!-- begin main menu -->
			
			<!--______________________________________________________________________________-->


			<!-- begin------------------- main------------------- menu -->
			<div class="menu_container">

				<div class="menu_items">

					
					<ul class="main_menu">


						<li><a href="index.aspx">Home</a><br /><span>Welcome</span></li>
						<li><a href="#.html">Our Specialities</a><br /><span>what we offer</span>
							<ul>
								<li><a href="#.html">My Expense Manager</a></li>

								<li><a href="#.html">My Income Manager</a></li>

								<li><a href="#.html">My Assets Manager</a></li>

								<li><a href="#">My Tax Manager</a></li>			

								<li><a href="#">My Annual Deficit</a></li>			

								<li><a href="#.html">Investment Designer</a></li>	

			    					<li><a href="#.html">Investment Manager</a></li>

								<li><a href="#.html">My Risks Manager</a></li>

								<li><a href="#.html">My Insurance Manager</a></li>

								<li><a href="#.html">My SMS Alerter</a></li>

								<li><a href="#.html">My Total Wealth Report</a></li>

								<li><a href="#.html">My Knowledge Gain(Financial)</a>
										<ul>
										<li><a href="#.html">Articles Read</a></li>
										<li><a href="#.html">Articles To Be Read Later</a></li>
										<li><a href="#.html">Videos's Seen</a></li>
										<li><a href="#.html">Video's To Be Seen</a></li>

										<li><a href="#.html">Articles Written</a></li>
										<li><a href="#.html">Questions Asked</a></li>
										<li><a href="#.html">Questions Answered</a></li>
										<li><a href="#.html">Certified in Courses</a></li>
										<li><a href="#.html">Courses in Progress</a></li>
										</ul>

								</li>

 								<li><a href="#.html">My Score Card</a>
										<ul>
										<li><a href="#.html">Knowledge Score</a></li>
										<li><a href="#.html">Document Management Score</a></li>
										<li><a href="#.html">Tax Management Score</a></li>

										<li><a href="#.html">Expense Mgmt Score</a></li>
										<li><a href="#.html">Income Mgmt Score</a></li>
										<li><a href="#.html">Inflation OverCome Score</a></li>
										<li><a href="#.html">Site Usage Score</a></li>
										<li><a href="#.html">Mock Games Score</a></li>
										<li><a href="#.html">Investment Gain Score</a></li>

										</ul>
								</li>

								<li><a href="#.html">Money From My Skills</a></li>

								<li><a href="#.html">Edit My Profile(s)</a></li>

 									
							
							</ul>
								
						
						</li>						
						
						<li><a href="#.html">Grow Money Here:-</a><br/><span>Investment Avenues</span>

							<ul>
								<li><a href="#.html">Low Risk Low Return</a>
										<ul>
										<li><a href="fd.html">Bank Fixed Deposits</a></li>
										<li><a href="gsec.html">Government Securities</a></li>
										<li><a href="#.html">Bonds</a></li>
										<li><a href="#.html">Debentures</a></li>

										<li><a href="ppf.html">Public Provident Fund</a></li>
										<li><a href="#.html">Kisan Vikas Patra</a></li>
										<li><a href="#.html">Insurances</a></li>
										<li><a href="#.html">Treasury Bills</a></li>
										<li><a href="#.html">Commercal Papers</a></li>
										<li><a href="#.html">Certificates Of Deposits</a></li>

										</ul>
								</li>

								<li><a href="#">Low Risk Good Return</a>
										<ul>
										<li><a href="#.html">Long Term Debt Funds</a></li>
										<li><a href="#.html">Corporate Fixed Deposits</a></li>
										<li><a href="#.html">Liquid Funds</a></li>

										</ul>
								</li>

								<li><a href="#.html">Medium Risk Medium Return</a>
										<ul>
										<li><a href="#.html">Gold ETF</a></li>
										<li><a href="#.html">Silver ETF</a></li>
										<li><a href="#.html">Gold & Silver Physical</a></li>

										<li><a href="#.html">Low Equity Hybrid Funds</a></li>
										<li><a href="#.html">ELSS</a></li>
										<li><a href="#.html">Real Estate</a></li>
										</ul>
								</li>

								<li><a href="#">Medium Risk Better Return</a>

										<ul>
										
										<li><a href="#.html">3 Yrs+ Equity Mutual Fund*</a></li>
										<li><a href="#.html">5 Yrs+ Equity Mutual Fund*</a></li>
										<li><a href="#.html">7 Yrs+ Equity Mutual Fund*</a></li>
										</ul>
								</li>			

								<li><a href="#">Medium Risk Great Return</a></li>			

								<li><a href="#.html">High Risk High Return</a>

										<ul>
										<li><a href="#.html">Calls</a></li>
										<li><a href="#.html">Puts</a></li>
										<li><a href="#.html">Futures</a></li>
										<li><a href="#.html">Index Trade</a></li>
										<li><a href="#.html">Commodity Trading</a></li>

										<li><a href="#.html">Equity Mutual Funds</a></li>
										<li><a href="#.html">Monthly to Quarterly Stocks</a></li>
										<li><a href="#.html">Stock Investments</a></li>
										<li><a href="#.html">IPO's & FPO's</a></li>
										</ul>
								</li>	

			    					<li><a href="#.html">High Risk Huge Returns</a>

										<ul>
										<li><a href="#.html">IntraDay Stock Trading</a></li>
										<li><a href="#.html">Weekly Stock Trading</a></li>
										</ul>
								</li>

									
							
							</ul>
								
						
						</li>	

						<li><a href="#.html">Screeners</a><br /><span>Sort Stocks/Funds</span>

										<ul>
										<li><a href="#.html">Stock Screener</a></li>
										<li><a href="#.html">Mutual Funds Screener</a></li>
										<li><a href="#.html">How to Select good Stocks</a></li>
										<li><a href="#.html">How to select good Funds</a></li>
										</ul>
								</li>

						<li><a href="#.html">Must Reads</a><br /><span>And Courses</span>
										<ul>
										<li><a href="#.html">Must Read Articles</a></li>
										<li><a href="#.html">Must See Videos</a></li>
										<li><a href="#.html">Certified Courses Offered</a></li>
										<li><a href="#.html">Quick Tutorials</a></li>

										<li><a href="#.html">Rated Articles</a></li>
										<li><a href="#.html">Test Your Knowledge</a></li>
										</ul>
								</li>
						<li><a href="Calculator.htm">Tools</a><br /><span>& CalC's</span></li>

						<li><a href="#.html">SaveTax</a><br /><span>& More</span></li>

					
					</ul>
					
				</div>
			</div>
			<!-- end main menu -->

		</div>
		<!-- end header content -->
	
	</div>	
	<!-- end header background -->

	

</div>
<!-- end header -->



			<!--______________________________________________________________________________-->

		
			




















<!--______________________________________________________________________________-->

		
			


<div class="page_top"></div>


<!-- begin container -->
<div class="container">

	<!-- begin site content -->
	<div class="site_content">
	
		<!-- begin left shadow -->
		<div class="container_page_left_shadow">
		
			<!-- begin right shadow -->
			<div class="container_page_right_shadow">
				
				<!-- begin container text -->

				<div class="container_text">


					<div class="page_line"></div>
					
					

<div id="result-panel-container">
<br />
<form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td style="width: 100px">
                    Username</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Password</td>
                <td style="width: 100px">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 26px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" /></td>
                <td style="width: 100px; height: 26px">
                </td>
                <td style="width: 100px; height: 26px">
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label><br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Retrive_Password.aspx">Retrive Password</asp:HyperLink><br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">New User !!! Register Here</asp:HyperLink></div>
    </form>
    
</div> <!-- eond of container -->
        
    		




		</div>
					












					
					</div>

					<!-- end bottom widgets -->

				</div>
				<!-- end container text -->
				
			</div>
			<!-- end right shadow -->
		
		</div>
		<!-- end left shadow -->
		
<!-- end container -->

<!--______________________________________________________________________________-->



































					
					

					<!-- end bottom widgets -->

				
				<!-- end container text -->
				
			
			<!-- end right shadow -->
		
		
		<!-- end left shadow -->
		
	

	<!-- end site content -->

	

<!-- end container -->

<!--______________________________________________________________________________-->



<!-- begin footer -->
<div class="footer">

	
		
		<!-- begin footer pages -->
		<div class="footer_widget_pages">
		<br />

			<ul>
				<li><a href="index.aspx">Home</a></li>

				<li><a href="#.html">Our Specialities</a></li>
				<li><a href="#.html">Grow Money Here</a></li>

				<li><a href="#.html">Screeners</a></li>
				<li><a href="#.html">Must Reads</a></li>

				<li><a href="Calculator.htm">Tools</a></li>
			</ul>

		</div>
<br />
</div>
		<!-- end footer pages -->
		<div class="cleardiv"></div>

	
		
		

			

<!-- end footer -->

<script type="text/javascript">Cufon.now();</script>
</body>

<!-- Code Developed By Mrudang Mathuria -->
</html>
