import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/widgets/profile_picture.dart';

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
          children: [
            _widgetShowcase(
              title: "profile_picture.dart",
              widget: ProfilePicture(
                "https://images.unsplash.com/photo-1605964883324-6d18a190faf3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=631&q=80",
                radius: 50,
                borderWidth: 2,
                borderColor: Colors.yellow,
              ),
            ),
          ],
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
