import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Widgets"),
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [],
        ),
      ),
    );
  }

  Column _widgetShowcase({
    @required String title,
    @required Widget widget,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        widget,
        SizedBox(height: 10),
        Divider(color: Colors.white, thickness: 1),
      ],
    );
  }
}
