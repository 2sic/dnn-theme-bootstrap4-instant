<%@ Control language="C#" Inherits="System.Web.UI.UserControl" %>
<%@ Import Namespace="DotNetNuke.Entities.Portals" %>

<script runat="server">

	/// <summary>
	/// This contains the name of the layout to be used. Values: default, wide, box, full
	/// </summary>
	public string Layout {get; set;}

	/// <summary>
	/// This contains the heading variation. Values: left, right, center
	/// </summary>
	public string Navigation {get; set;}


	protected override void OnPreRender(EventArgs e)
	{
		base.OnPreRender(e); 
		HtmlGenericControl body = (HtmlGenericControl)this.Page.FindControl("ctl00$body");
		body.Attributes["class"] = GetCssClassesForBody();
	}
	
	private string GetCssClassesForBody()
	{
		// Get objects we want to inform about in the CSS classes
		var portal = DotNetNuke.Entities.Portals.PortalSettings.Current;
		var tab = portal.ActiveTab;
		var rootTab = tab.BreadCrumbs[0] as DotNetNuke.Entities.Tabs.TabInfo;
		var neutralRoot = rootTab.IsDefaultLanguage || rootTab.IsNeutralCulture ? rootTab : rootTab.DefaultLanguageTab;

		return CurrentPageClasses(portal, tab)
			+ LanguageClasses(portal, rootTab, neutralRoot)
			+ PageAndPortalClasses(portal, rootTab, neutralRoot)
			+ LayoutVariationClasses()
			+ UserRoleClasses(portal);
	}


	/// <summary>
	/// Calculate the names of the CSS classes for the selected layout
	/// </summary>
	private string LayoutVariationClasses()
	{
		var layout = Layout;
		if(string.IsNullOrEmpty(layout)) layout = "Default";

		var nav = Navigation;
		if(string.IsNullOrEmpty(nav)) nav = "Right";
		return " va-layout-" + layout.ToLower() + " va-mainnav-" + nav.ToLower() + " ";
	}


	/// <summary>
	/// Classes for the body which tell the skin and JS what language is used
	/// </summary>
	private string LanguageClasses(PortalSettings portal, DotNetNuke.Entities.Tabs.TabInfo root, DotNetNuke.Entities.Tabs.TabInfo neutralRoot)
	{
		var currentLang = System.Threading.Thread.CurrentThread.CurrentCulture.TwoLetterISOLanguageName.ToLower();
		var rootLang = string.IsNullOrEmpty(root.CultureCode)
			? currentLang
			: root.CultureCode.ToLower().Substring(0, 2);
		var neutralLang = string.IsNullOrEmpty(neutralRoot.CultureCode)
			? currentLang
			: neutralRoot.CultureCode.ToLower().Substring(0, 2);
		return " lang-" + currentLang
			+ " lang-root-" + rootLang 
			+ " lang-neutral-" + neutralLang + " ";
	}


	/// <summary>
	/// Classes for the body which tell the skin and JS about the current page
	/// </summary>
	private string CurrentPageClasses(PortalSettings portal, DotNetNuke.Entities.Tabs.TabInfo tab)
	{
		return "tab-" + tab.TabID + " " 
			+ (portal.HomeTabId == portal.ActiveTab.TabID ? "tab-is-home " : "")
			+ "tab-level-" + tab.Level + " ";
	}


	/// <summary>
	/// Classes for the body which tell the skin and JS what language is used
	/// </summary>
	private string PageAndPortalClasses(PortalSettings portal, DotNetNuke.Entities.Tabs.TabInfo rootTab, DotNetNuke.Entities.Tabs.TabInfo neutralRoot)
	{
		return " portal-" + portal.PortalId
			+ " root-tab-" + rootTab.TabID
			+ " root-neutral-tab-" + neutralRoot.TabID;
	}

	/// <summary>
	/// Classes for the body which tell the skin and JS about the user role
	/// </summary>
	private string UserRoleClasses(PortalSettings portal)
	{
		return (DotNetNuke.Security.PortalSecurity.IsInRoles(portal.AdministratorRoleName))
			? " role-admin "
			: "";
	}
</script>
