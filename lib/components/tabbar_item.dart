import 'package:flutter/material.dart';

class TabBarItem extends BottomNavigationBarItem {
  TabBarItem(String iconName, String title):
      super(
        icon: Image.asset("assets/img/tabbar/$iconName.png", width: 30,),
        activeIcon: Image.asset("assets/img/tabbar/${iconName}_active.png", width: 30,),
        label: title,
      );
}