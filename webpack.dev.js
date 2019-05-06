const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const FriendlyErrorsWebpackPlugin = require('friendly-errors-webpack-plugin');
const WebpackBar = require('webpackbar');

module.exports = {
  entry: ['./src/scss/full-package.scss', './src/ts/main.ts'],
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'main.min.js',
  },
  mode: 'development',
  watch: true,
  stats: {
    all: false,
    assets: true
  },
  resolve: {
    extensions: ['.ts', '.tsx', '.js', '.scss']
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