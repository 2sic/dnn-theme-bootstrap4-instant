<%@ Control language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<%-- Change the page title to contain the breadcrumbi in an SEO optimized way --%>
<%@ Register TagPrefix="tosic" TagName="PageTitle" src="controls/optimize-page-title.ascx" %>
<tosic:PageTitle runat="server" />

<%-- Set common CSS classes on the body which determine the Layout 
	Layout="Full" are: Default, Wide, Full, Box
	Navigation="Left": Right, Center, Left
--%>
<%@ Register TagPrefix="tosic" TagName="BodyCssClasses" src="controls/body-css-classes.ascx" %>
<tosic:BodyCssClasses runat="server" Layout="Landingpage" Navigation="Right"/>

<%-- Activate Quick-Edit in empty pages if 2sxc is installed
  more infos on 2sxc quick-edit: https://2sxc.org/en/blog/post/quick-edit-2-add-move-delete-modules-in-preview-touch-capable-for-dnn
--%>
<%@ Register TagPrefix="tosic" TagName="SxcQuickEdit" src="controls/2sxc-quickedit.ascx" %>
<tosic:SxcQuickEdit runat="server" />

<%-- Include Google Font 
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
--%>


<a class="sr-only sr-only-focusable" href="#content"><%= LocalizeString("SkipLink.MainContent") %></a>

<div class="ly-fullwrapper">
	<header>
		<div class="container-fluid d-flex">			
			<a class="ly-logo" href="/" title="Bootstrap 4 Instant (change this in the landingpage.ascx)">			
				<img alt="Logo" class="img-fluid" src="<%=SkinPath%>images/landingpage/logo.svg" data-fallback="<%=SkinPath%>images/landingpage/logo.png" onerror="this.src=this.getAttribute('data-fallback');this.onerror=null;">
			</a>
			<!-- <nav id="nav-mobile">
				<div class="ly-header-mobile">
					<div class="container-fluid">
						<a class="ly-logo" href="/" title="Bootstrap 4 Instant (change this in the default.ascx)">			
							<img alt="Logo" class="img-fluid" src="<%#SkinPath%>images/logo.svg" data-fallback="<%#SkinPath%>images/logo.png" onerror="this.src=this.getAttribute('data-fallback');this.onerror=null;">
						</a>
					</div>
				</div>
				<div class="ly-nav-mobile-container">
					<dnn:MENU MenuStyle="nav/main-mobile" NodeSelector="*,0,6" runat="server" />
				</div>
			</nav> 
			<div id="nav-icon" class="ly-hamburger" title="Menu">
				<div>
				<span></span>
				<span></span>
				<span></span>
				</div>
			</div>
			<nav id="nav-desktop" class="navbar d-none d-lg-block">
				<dnn:MENU MenuStyle="nav/main" NodeSelector="*,0,0" runat="server" />
			</nav>
			-->
		</div>
	</header>

	<div id="content">
		<div class="container-fluid ly-content">
			<div class="ly-container-inner">
				<div class="ly-contentpane-full">
					<div id="ContentPane" runat="server" containertype="G" containername="Invisible Container" containersrc="default.ascx"></div>
				</div>
			</div>
			<a class="ly-top" href="#" title="Nach oben"><i></i></a>
		</div>
	</div>
	<div class="ly-push"></div>
</div>
<footer>
    <div class="container-fluid d-flex justify-content-md-between flex-column flex-md-row">
              <ul class="ly-footer-address clearfix" itemscope itemtype="http://schema.org/LocalBusiness">
				<li>
					<strong itemprop="name">Bootstrap 4 Instant</strong>
				</li>
				<li>
					<span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
						<span itemprop="streetAddress">Instant Road 77</span>,
						<span itemprop="postalCode">50355</span>
						<span itemprop="addressLocality">Instant City</span>,
						<span itemprop="addressCountry">Instant Country</span>
					</span>
				</li>
                <li><i class="fas fa-phone"></i>&nbsp;<a href="tel:+41817506777">+41 81 750 67 77</a></li>
				<li>
					<i class="far fa-envelope"></i>&nbsp;<span data-madr1="instant" data-madr2="example" data-madr3="com" data-linktext="instant@example.com"></span>
				</li>
            </ul>
            <div class="ly-footer-imprint">
                <dnn:login id="DnnLogin" cssclass="ly-login d-none d-lg-inline-flex" runat="server" />
                <a href="<%= LocalizeString("Imprint.Url") %>" title="<%= LocalizeString("Imprint.Text") %>"><%= LocalizeString("Imprint.Text") %></a> | 
				<a href="<%= LocalizeString("Privacy.Url") %>" title="<%= LocalizeString("Privacy.Text") %>"><%= LocalizeString("Privacy.Text") %></a>
            </div>
    </div>
</footer>


<!-- include files -->
<dnn:DnnCssInclude runat="server" FilePath="dist/theme.min.css" Priority="100" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="dist/theme.min.js" ForceProvider="DnnFormBottomProvider" Priority="130" PathNameAlias="SkinPath" />

<script defer async src="https://use.fontawesome.com/releases/v5.12.0/js/all.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/solid.css" integrity="sha384-n4xPrkfCJ3FzmPwM/Nf1QQu7Qx6oDcsbMp+qPOxrJ5w0Tq19ZWd9ylcMWkzKEpwP" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/fontawesome.css" integrity="sha384-Sbwc59I1SOoVoCGgBCwAe/M1j5a9cHixHv/7x9vOxORnT73jUaxyK0paobkk3JSt" crossorigin="anonymous">

<script runat="server">
	
	protected override void OnLoad(EventArgs e)
	{
		base.OnLoad(e);
		AttachCustomHeader("<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no' />");

		// Set various FavIcon and Icon headers according to best practices
		// The next line is disabled by default, because it requires RazorBlade to be installed.
		// How to install RazorBlade 3: https://azing.org/dnn-community/r/zbh8JC5T
		// How to create best-practice FavIcons: https://azing.org/dnn-community/r/UhgWJbxh
		// ToSic.Razor.Blade.HtmlPage.AddIconSet(SkinPath + "favicon.png");
	}
	
	protected void AttachExternalCSS(string CSSPath) { AttachCustomHeader("<link type='text/css' rel='stylesheet' href='" + CSSPath + "' />"); }
	protected void AttachExternalJS(string JSPath) { AttachCustomHeader("<script type='text/javascript' src='" + JSPath + "'></scr" + "ipt>"); }
	protected void AttachCustomHeader(string CustomHeader) { HtmlHead HtmlHead = (HtmlHead)Page.FindControl("Head"); if ((HtmlHead != null)) { HtmlHead.Controls.Add(new LiteralControl(CustomHeader));	}	}
	
	protected string LocalizeString(string key)
	{
			return Localization.GetString(key, Localization.GetResourceFile(this, System.IO.Path.GetFileName(this.AppRelativeVirtualPath)));
	}
</script>

