import 'package:flutter/material.dart';

class Mall extends StatelessWidget {
  const Mall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("市集")),
      ),
      body: Center(
        child: Text("市集", style: TextStyle(fontSize: 50),),
      ),
    );
  }
}
