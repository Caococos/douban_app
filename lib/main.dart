// import 'package:douban_app/components/tabbar_item.dart';
import 'package:douban_app/views/group/group.dart';
import 'package:douban_app/views/home/home.dart';
import 'package:douban_app/views/mall/mall.dart';
import 'package:douban_app/views/profile/profile.dart';
import 'package:douban_app/views/subject/subject.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "陈签影院",
      theme: ThemeData(
        primaryColor: Colors.green,
        // colorScheme: ColorScheme.light().copyWith(primary: Colors.green),  //colorScheme优先级比primarySwatch要高
        primarySwatch: Colors.green,
        highlightColor: Colors.transparent,  //高亮效果
        splashColor: Colors.transparent      //水波纹效果
      ),
      home: const StackPage(),
    );
  }
}

class StackPage extends StatefulWidget {
  const StackPage({super.key});

  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  int _currentIndex = 0;  //导航索引，默认首页

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.red,  //一般不在这里更改顶部栏的颜色
        currentIndex: _currentIndex,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,  //固定显示
        items: [
          createItem("home", "首页"),
          createItem("subject", "书影音"),
          createItem("group", "小组"),
          createItem("mall", "市集"),
          createItem("profile", "我的"),
        //   TabBarItem("home", "首页"),
        //   TabBarItem("subject", "书影音"),
        //   TabBarItem("group", "小组"),
        //   TabBarItem("mall", "市集"),
        //   TabBarItem("profile", "我的"),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          Home(),
          Subject(),
          Group(),
          Mall(),
          Profile()
        ],
      )
    );
  }

  BottomNavigationBarItem createItem(String iconName, String title) {
    return BottomNavigationBarItem(
      icon: Image.asset("assets/img/tabbar/${iconName}.png", width: 30,),
      activeIcon: Image.asset("assets/img/tabbar/${iconName}_active.png", width: 30,),
      label: title,
    );
  }
}
