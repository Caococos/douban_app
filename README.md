# douban_app

flutter练习项目，coderwhy老师的flutter高仿豆瓣app项目，[原项目地址](https://github.com/coderwhy/flutter_douban_app)

## What have I learned?

* 底部导航栏TabBar的实现
* 根据底部导航栏切换页面
* 修改主题颜色和水波纹效果、高亮效果
* 封装部分功能的Widget函数
* 网络请求的封装(dio)
* 网络数据map转model
* 封装虚线
* 封装评价小星星

总的来说，学习到的部分主要是布局和样式，以及小部分网络请求的知识。

其中有个比较难的地方，在一行中显示图标和文字并且文字超出时自动换行，正常Row和Column组件都无法自动换行并且会报错，Wrap和Flex以及SizedBox的自动换行是整段文字换行无法实现预期效果。

这里使用Stack组件和Text.rich富文本实现。

![douban_movie_name](https://cdn.jsdelivr.net/gh/caococos/resource-set@master/Read-me/douban_movie_name.jpg)



For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
