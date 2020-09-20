const { resolve, join } = require('path');

const { merge } = require('webpack-merge');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ManifestPlugin = require('webpack-manifest-plugin');

module.exports = ({ environment }) => {
  const development = environment === 'development';
  const MiniCssLoader = {
    loader: MiniCssExtractPlugin.loader,
    options: {
      publicPath: './public/assets'
    }
  };

  return merge({
    entry: {
      application: './apps/web/assets/javascripts/application.js'
    },
    output: {
      filename: '[name][hash].js',
      path: resolve(__dirname, './public/assets')
    },
    mode: environment,
    devtool: development && 'inline-source-maps',
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /(node_modules)/,
          use: {
            loader: 'babel-loader'
          }
        },
        {
          test: /\.scss$/,
          use: [
            development ? 'style-loader' : MiniCssLoader,
            'css-loader',
            'sass-loader',
            'postcss-loader'
          ]
        },
        {
          test: /\.(png|svg|jpg|gif|jpeg|woff|woff2)$/,
          use: ['file-loader']
        }
      ]
    },
    devServer: {
      contentBase: join(__dirname, 'public', 'assets'),
      port: 8080,
      publicPath: '/assets/'
    },
    plugins: [
      new MiniCssExtractPlugin({
        filename: '[name].[hash].css',
        chunkFilename: '[id].[hash].css'
      }),
      new HtmlWebpackPlugin({
        title: 'Simple Talk App',
        minify: !development
      }),
      new ManifestPlugin({
        fileName: 'assets.json'
      })
    ]
  });
};
