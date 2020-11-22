import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/widgets/add_button.dart';
import 'package:flutter_common_widgets/widgets/cart_icon.dart';
import 'package:flutter_common_widgets/widgets/custom_button.dart';
import 'package:flutter_common_widgets/widgets/my_cached_network_image.dart';
import 'package:flutter_common_widgets/widgets/profile_picture.dart';

class MyHomePage extends StatelessWidget {
  static const IMAGE_URL =
      "https://images.unsplash.com/photo-1605964883324-6d18a190faf3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=631&q=80";

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
                IMAGE_URL,
                radius: 50,
                borderWidth: 2,
                borderColor: Colors.yellow,
              ),
            ),
            _widgetShowcase(
              title: "add_button.dart",
              widget: AddButton(width: 125),
            ),
            _widgetShowcase(
              title: "cart_icon.dart",
              widget: CartIcon(count: 29),
            ),
            _widgetShowcase(
              title: "custom_button.dart",
              widget: CustomButton(
                text: "My Button",
                onTap: () {},
                showShadow: false,
                margin: EdgeInsets.all(10),
              ),
            ),
            _widgetShowcase(
              title: "my_cached_network_image.dart",
              widget: MyCachedNetworkImage(
                url: IMAGE_URL,
                padding: EdgeInsets.all(10),
                imageHeight: 200,
                imageWidth: double.infinity,
                borderRadius: 10,
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
