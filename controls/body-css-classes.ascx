<%@ Control language="C#" Inherits="System.Web.UI.UserControl" %>

<script runat="server">
	protected override void OnPreRender(EventArgs e)
	{
		base.OnPreRender(e); 
		AddCSSClassesForSkinning();
	}
	
	private void AddCSSClassesForSkinning()
	{
		var PortalSettings = DotNetNuke.Entities.Portals.PortalSettings.Current;
		//add language, edit mode, tab-id and root-tab-id to body css class
		string CssClass = "tab-" + PortalSettings.ActiveTab.TabID.ToString() + " ";
		if(DotNetNuke.Security.PortalSecurity.IsInRoles(PortalSettings.AdministratorRoleName))
			CssClass += "role-admin ";
		CssClass += "tab-level-" + PortalSettings.ActiveTab.Level + " ";
		CssClass += "root-" + ((DotNetNuke.Entities.Tabs.TabInfo)PortalSettings.ActiveTab.BreadCrumbs[0]).TabID.ToString() + " ";
		var rootTab = ((DotNetNuke.Entities.Tabs.TabInfo)PortalSettings.ActiveTab.BreadCrumbs[0]);
		rootTab = rootTab.IsDefaultLanguage || rootTab.IsNeutralCulture ? rootTab : rootTab.DefaultLanguageTab;
		CssClass += "lang-root-" + rootTab.TabID + " ";
		CssClass += "lang-" + System.Threading.Thread.CurrentThread.CurrentCulture.TwoLetterISOLanguageName.ToLower() + " ";
		CssClass += (PortalSettings.HomeTabId == PortalSettings.ActiveTab.TabID ? "tab-home " : "") + " ";
		CssClass += "portal-" + PortalSettings.Current.PortalId;
		CssClass += " va-layout-default"; // va-layout-wide, va-layout-default, va-layout-box, va-layout-full
		CssClass += " va-mainnav-right "; // va-mainnav-left, va-mainnav-right, va-mainnav-center
		HtmlGenericControl body = (HtmlGenericControl)this.Page.FindControl("ctl00$body");
		body.Attributes["class"] = CssClass;
	}
</script>
