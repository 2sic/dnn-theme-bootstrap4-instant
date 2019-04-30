const path = require('path');
const TerserJSPlugin = require('terser-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const entry = require('webpack-glob-entry')

module.exports  = env => {
  return {
    entry: entry('./src/full-package.scss'),
    output: {
      path: path.resolve(__dirname, ((env && env.staging) ? 'dist-webpack/staging' : 'dist-webpack/live')),
      filename: 'app-bundle.min.js',
    },
    devtool: 'source-map',
    watch: true,
    resolve: {
      extensions: ['.scss']
    },
    optimization: {
      minimizer: [
        new TerserJSPlugin({
          sourceMap: true,
        }), 
        new OptimizeCSSAssetsPlugin({ 
          cssProcessorOptions: { 
            map: { 
              inline: false, 
              annotation: true, 
            } 
          } 
        })
      ],
    },
    plugins: [
      new MiniCssExtractPlugin({
        filename: 'style.min.css',
      }),
    ],
    module: {
      rules: [
        {
          test: /\.(sa|sc|c)ss$/,
          use: [
            MiniCssExtractPlugin.loader,
            {
              loader: 'css-loader',
              options: {
                  sourceMap: true,
              }
            }, {
              loader: 'sass-loader',
              options: {
                  sourceMap: true,
              }
            }
          ],
        },
      ],
    },
  }
};