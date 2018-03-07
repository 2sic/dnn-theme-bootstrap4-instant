<%@ Control language="C#" Inherits="System.Web.UI.UserControl" %>
<%--
	This control automatically injects the 2sxc Quickedit control, if 2sxc is
	installed. If it's not installed, the control will not do anything.
	Read more about the quickedit functionality here:'
	https://github.com/2sic/2sxc/wiki/Concept-Quick-Edit
--%>
<asp:Placeholder runat="server" id="QuickEditPlaceholder" />

<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        try {
            // Loads the 2sxc QuickEdit control, if it's available
            var path = "~/DesktopModules/ToSIC_SexyContent/DnnWebForms/Skins/QuickEdit.ascx";
            if (System.IO.File.Exists(Server.MapPath(path))) {
                var control = LoadControl(path);
                QuickEditPlaceholder.Controls.Add(control);
            }
        }
        catch (Exception) // Fail silently
        {}
    }
</script>
