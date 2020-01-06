# SCSS Variables

## How it works

1. The `theme.scss` file is the entry point. Webpack takes this and generates the  `dist/theme.min.css`
1. The `_variables.scss` is the file that prepares all the variables. This is where you will usually make adjustments or override Bootstrap variables

## How to use

1. First make sure you can build. That means make sure you already did `npm install` 
1. To compile the CSS, use `npm run develop` or `npm run build`. Build will also minify the files.

Then make changes to the `_variables.scss` as you need. In case you need more bootstrap parts like _jumbotron_ just activate them in the `theme.scss`.