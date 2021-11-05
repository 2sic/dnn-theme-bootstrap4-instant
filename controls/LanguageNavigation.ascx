<%@ Control Language="C#" AutoEventWireup="true" %>

<script runat="server">
    public string Languages { get; set; }

    protected string[] LanguagesArray
    {
        get { return Languages.Split(','); }
    }

    DotNetNuke.UI.Skins.Controls.LanguageTokenReplace LanguageTokenReplace = new DotNetNuke.UI.Skins.Controls.LanguageTokenReplace();

    string GetCurrentTabUrlForLanguage(string language)
    {
        LanguageTokenReplace.Language = language;
        return LanguageTokenReplace.ReplaceEnvironmentTokens("[URL]");
    }

    bool ShowLanguageSwitchForLanguage(string language)
    {
        var locale = new LocaleController().GetLocale(PortalSettings.Current.PortalId, language);
        var permissionProvider = new DotNetNuke.Security.Permissions.PermissionProvider();
        var defaultLanguageTab = PortalSettings.Current.ActiveTab.IsDefaultLanguage ? PortalSettings.Current.ActiveTab : PortalSettings.Current.ActiveTab.DefaultLanguageTab;
        var tabForLanguage = new TabController().GetTabByCulture(defaultLanguageTab.TabID, PortalSettings.Current.PortalId, locale);

        if (tabForLanguage != null && permissionProvider.HasTabPermission(permissionProvider.GetTabPermissions(tabForLanguage.TabID, PortalSettings.Current.PortalId), "VIEW"))
            return true;

        return false;
    }

</script>

<ul class="ly-language">
    <% foreach (var language in LanguagesArray) { %>
        <% var lang = language.Split(':'); %>
        <% if (ShowLanguageSwitchForLanguage(lang[0]))
            { %>
            <li class="<%= "nav-" + lang[0].ToLower() %><%= lang[0].ToLower() == CultureInfo.CurrentCulture.ToString().ToLower() ? " active" : "" %>">
                <a href="<%= GetCurrentTabUrlForLanguage(lang[0]) %>"><%= lang[1] %></a>
            </li>
        <% } %>
    <% } %>
</ul>