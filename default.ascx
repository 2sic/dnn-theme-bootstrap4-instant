<%@ Control language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="tosic" TagName="PageTitle" src="controls/optimize-page-title.ascx" %>
<tosic:PageTitle runat="server" />
<%@ Register TagPrefix="tosic" TagName="BodyCssClasses" src="controls/body-css-classes.ascx" %>
<tosic:BodyCssClasses runat="server" />

<%--
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
		<div class="container-fluid clearfix">
			<div class="ly-container-inner">
				<div class="ly-overlay"></div>	
				<div id="nav-icon" class="ly-nav-mobile-trigger float-left" title="Menu">
					<span></span>
					<span></span>
					<span></span>
				</div>
				<nav id="nav-mobile">
					<div class="ly-header-mobile">
						<div class="container-fluid clearfix">
							<a href="#" class="ly-close"></a>
							<a class="ly-logo" href="/" title="Bootstrap 4 Instant (change this in the default.ascx)">			
								<img alt="Logo" src="<%#SkinPath%>images/logo.svg" data-fallback="<%#SkinPath%>images/logo.png" onerror="this.src=this.getAttribute('data-fallback');this.onerror=null;">
							</a>
						</div>
					</div>
					<dnn:MENU MenuStyle="nav/main-mobile" NodeSelector="*,0,6" runat="server" />
				</nav>

				<a class="ly-logo" href="/" title="Bootstrap 4 Instant (change this in the default.ascx)">			
					<img alt="Logo" src="<%=SkinPath%>images/logo.svg" data-fallback="<%=SkinPath%>images/logo.png" onerror="this.src=this.getAttribute('data-fallback');this.onerror=null;">
				</a>

				<nav id="nav-desktop" class="navbar d-none d-lg-block">
					<dnn:MENU MenuStyle="nav/main" NodeSelector="*,0,0" runat="server" />
				</nav>

			</div>
		</div>
	</header>

	<div class="container-fluid ly-header-pane <%= (HeaderPane.Attributes["class"] ?? "").Contains("DNNEmptyPane") ? "ly-header-pane-empty" : "" %>">
		<div class="ly-container-inner">
			<div id="HeaderPane" runat="server" containertype="G" containername="Invisible Container" containersrc="default.ascx"></div>
		</div>
	</div>

	<div id="content">
		<div class="container-fluid ly-content">
		<p class="ly-welcome-text">
			This is the Bootstrap4 Instant Theme for DNN. Read the <a href="https://github.com/2sic/dnn-theme-bootstrap4-instant/wiki">Wiki</a> for further instructions.
		</p>
			<div class="ly-container-inner">
				<div class="ly-contentpane-full">
					<div id="ContentPane" runat="server" containertype="G" containername="Invisible Container" containersrc="default.ascx"></div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-lg-9 order-lg-2 ly-col-contentpane">
						<div id="RightPane" runat="server" containertype="G" containername="Invisible Container" containersrc="default.ascx"></div>
					</div>
					<div class="col-xs-12 col-lg-3 order-lg-1 ly-col-leftpane">
						<div id="nav-sub" class="d-none d-sm-block">
							<dnn:MENU MenuStyle="nav/sub" NodeSelector="+0,0,2" runat="server" />
						</div>
						<div class="d-block d-sm-none">
							<dnn:MENU MenuStyle="nav/sub" NodeSelector="CurrentChildren" runat="server" />
						</div>
					</div>
				</div>
			</div>
			<a class="ly-top" href="#" title="Nach oben"><i></i></a>
		</div>
	</div>
	<div class="ly-push"></div>
</div>
<footer>
    <div class="container-fluid">
        <div class="ly-container-inner clearfix">
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
                <dnn:login id="DnnLogin" cssclass="ly-login d-sm-none-down" runat="server" />
                <a href="<%= LocalizeString("Imprint.Url") %>" title="<%= LocalizeString("Imprint.Text") %>"><%= LocalizeString("Imprint.Text") %></a> | 
				<a href="<%= LocalizeString("Privacy.Url") %>" title="<%= LocalizeString("Privacy.Text") %>"><%= LocalizeString("Privacy.Text") %></a>
            </div>
        </div>
    </div>
</footer>


<!-- include files -->
<dnn:DnnCssInclude runat="server" FilePath="dist/main.min.css" Priority="100" PathNameAlias="SkinPath" />

<dnn:DnnJsInclude runat="server" FilePath="dist/lib/bootstrap.min.js" ForceProvider="DnnFormBottomProvider" Priority="100" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="dist/lib/jquery.sidr.min.js" ForceProvider="DnnFormBottomProvider" Priority="110" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="dist/main.min.js" ForceProvider="DnnFormBottomProvider" Priority="130" PathNameAlias="SkinPath" />

<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>

<script runat="server">
	protected override void OnPreRender(EventArgs e)
	{
		base.OnPreRender(e);
	}
	
	protected override void OnLoad(EventArgs e)
	{
		base.OnLoad(e);
		AttachCustomHeader("<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no' />");
	}
	
	protected void AttachExternalCSS(string CSSPath) { AttachCustomHeader("<link type='text/css' rel='stylesheet' href='" + CSSPath + "' />"); }
	protected void AttachExternalJS(string JSPath) { AttachCustomHeader("<script type='text/javascript' src='" + JSPath + "'></scr" + "ipt>"); }
	protected void AttachCustomHeader(string CustomHeader) { HtmlHead HtmlHead = (HtmlHead)Page.FindControl("Head"); if ((HtmlHead != null)) { HtmlHead.Controls.Add(new LiteralControl(CustomHeader));	}	}
	
	protected string LocalizeString(string key)
	{
			return Localization.GetString(key, Localization.GetResourceFile(this, System.IO.Path.GetFileName(this.AppRelativeVirtualPath)));
	}
</script>

