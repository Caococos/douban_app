import 'package:douban_app/components/dashed_line.dart';
import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  const Subject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("书影音")),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.orange,
          child: ZHDashedLine(),
        ),
      ),
    );
  }
}
