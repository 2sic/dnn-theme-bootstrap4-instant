<%@ Control language="C#" Inherits="System.Web.UI.UserControl" %>
<%@ Import namespace="Connect.Razor.Blade" %>
<%--
	This control automatically adds a high-quality favicon to the page
    It requires RazorBlade 2.02 or newer to be installed
    How to Install RazorBlade: https://azing.org/dnn-community/r/zbh8JC5T
    Create a best-practice favicon: https://azing.org/dnn-community/r/UhgWJbxh
--%>
<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        HtmlPage.AddIconSet(PortalSettings.Current.ActiveTab.SkinPath + "favicon.png");
    }
</script>
