import 'package:douban_app/components/star_rating.dart';
import 'package:flutter/material.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("小组")),
      ),
      body: Center(
        child: ZHStarRating(rating: 5,),
      ),
    );
  }
}
