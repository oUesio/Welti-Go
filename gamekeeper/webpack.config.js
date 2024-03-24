module.exports = {
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        },
        
      },
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        },
      },
      {
        test: /\.(sa|sc|c)ss$/, // styles files
        use: ["style-loader", "css-loader", "sass-loader"],
      },
      {
        test: /\.(png|svg|jpg|jpeg|gif)$/i,
        type: 'asset/resource'
      }
      // {
      //   test: /\.(png|svg)$/i,
      //   loader: 'url-loader',
      //   options: {
      //     limit: false,
      //     name: '[name].[hash:7].[ext]',
      //     fallback: 'file-loader',
      //     outputPath: '../images',
      //     publicPath: '../images',
      //   },
      // },
    ]
  },
  resolve: {
    extensions: ["", ".js", ".jsx", ".es6"]
  },
};
