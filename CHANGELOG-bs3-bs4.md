# Changes from dnn-theme-boostrap3-instant to dnn-theme-bootstrap4-instant

* removed bower (deprecated), uses npm now
    * Dependencies moved from *bower.json* to *package.json*
    * Files are now located in *node_modules* instead of *bower_components*
    * Versions are locked with *package.lock*
* Renamed classes which were changed by bootstrap, including
    * `pull-left` > `float-left`
    * `hidden-*` > `d-none`, `d-lg-block`
    * Breakpoint shift: Moved all classes
* Breakpoint shift: Moved media queries
    * Bootstrap 4 added a new breakpoint for 576px+
    * Bootstrap 4 breakpoint sizes have shifted (sm is now md, md is now lg, lg is now xl)
* Media queries with @include
    * before: `@media (min-width: $screen-sm-min)`
    * after: `@include media-breakpoint-up(md)`
* Fixed issue in *package.json* (comments are not allowed)
* Removed separate *typography.css* from dist because we don't need this anymore
* Main (desktop) menu: added classes `nav-link` (li>a) and `nav-item` (li)
* Nav-sub: removed bootstrap class because it had no effect
* Variables: Bootstrap 4 has renamed and changed variables - took new variables file and moved existing variables (if existed) to new version
    * For variables that did not exist: defined variable in variables_2sic
    * Changed `$brand-primary` to `theme-color("primary")` globally
    * `$gray` is now $`gray-100`, there are more grayscales in bs4
* Removed Glyphicons and switched to FontAwesome
    * renamed all icon classes from `glyphicons-*` to `fa-*`
* Removed old shim files for IE9-
