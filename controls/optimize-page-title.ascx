<%@ Control language="C#" Inherits="System.Web.UI.UserControl" %>

<script runat="server">
	protected override void OnPreRender(EventArgs e)
	{
		base.OnPreRender(e);
		NormalizePageTitle();
	}
	
	// SEO page title script - v 2.0
    private void NormalizePageTitle()
    {
        const string separator = " | ";
        const int depth = 5;
        const bool includePortalName = true;
        
		if(String.IsNullOrEmpty(PortalSettings.Current.ActiveTab.Title))
			Page.Title = String.Join(separator, PortalSettings.Current.ActiveTab.BreadCrumbs.Cast<DotNetNuke.Entities.Tabs.TabInfo>()
				.Reverse().Take(depth).Select(p => p.TabName).Distinct().ToArray()) + 
				(includePortalName ? separator + PortalSettings.Current.PortalName : "");
    }
</script>
