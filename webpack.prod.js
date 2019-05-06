const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const FriendlyErrorsWebpackPlugin = require('friendly-errors-webpack-plugin');
const WebpackBar = require('webpackbar');

module.exports = {
  entry: ['./src/scss/full-package.scss', './src/ts/main.ts'],
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'main.min.js',
  },
  mode: 'production',
  devtool: 'source-map',
  stats: {
    all: false,
    assets: true
  },
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
    }),
    new WebpackBar(),
    new FriendlyErrorsWebpackPlugin(),
  ],
  module: {
    rules: [
      {
        test: /\.scss$/,
        exclude: /node_modules/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: 'css-loader'
          }, {
            loader: 'sass-loader'
          }
        ],
      },
      {
        test: /\.ts$/,
        exclude: /node_modules/,
        use: {
          loader: 'ts-loader'
        }
      }
    ],
  },
};