const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');

module.exports  = env => {
  return {
    entry: ['./src/scss/full-package.scss', './src/ts/main.ts'],
    output: {
      path: path.resolve(__dirname, ((env && env.staging) ? 'dist/staging' : 'dist/live')),
      filename: 'main.min.js',
    },
    mode: (env && env.staging) ? 'development' : 'production',
    devtool: 'source-map',
    watch: true,
    resolve: {
      extensions: ['.ts', '.tsx', '.js', '.scss']
    },
    optimization: {
      minimizer: [
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
        filename: 'main.min.css',
      })
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
        {
          test: /\.ts$/,
          use: {
            loader: 'ts-loader'
          }
        }
      ],
    },
  }
};