import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/widgets/add_button.dart';
import 'package:flutter_common_widgets/widgets/cart_icon.dart';
import 'package:flutter_common_widgets/widgets/custom_button.dart';
import 'package:flutter_common_widgets/widgets/my_cached_network_image.dart';
import 'package:flutter_common_widgets/widgets/my_image_slider.dart';
import 'package:flutter_common_widgets/widgets/my_text_field.dart';
import 'package:flutter_common_widgets/widgets/profile_picture.dart';

class MyHomePage extends StatelessWidget {
  static const IMAGE_URL =
      "https://images.unsplash.com/photo-1605964883324-6d18a190faf3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=631&q=80";
  static const List<String> imageUrls = [
    "https://images.unsplash.com/photo-1606017259066-546f13c8c90d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
    "https://images.unsplash.com/photo-1606005426430-9768fe577b3c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1605962608033-5795d98818a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1606017259057-527114e27826?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Widgets"),
        ),
        body: ListView(
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
              widget: AddButton(
                onChanged: (int v) => print('onChanged $v'),
                onMaxValue: (int v) => print('onMaxValue $v'),
                onMinValue: (int v) => print('onMinValue $v'),
                addIcon: Icons.arrow_forward_ios,
                removeIcon: Icons.arrow_back_ios,
                initialValue: 8,
                iconSize: 15,
                maxValue: 10,
                minValue: 5,
              ),
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
            _widgetShowcase(
              title: "my_image_slider.dart",
              widget: MyImageSlider(
                autoPlay: true,
                photoUrls: imageUrls,
                backgroundColor: Colors.black,
                showDots: true,
                activeDotColor: Colors.yellow,
                inactiveDotColor: Colors.red,
              ),
            ),
            _widgetShowcase(
              title: "my_text_field.dart",
              widget: MyTextField(
                labelText: "Search",
                onChanged: (String value) {},
                isPasswordField: true,
                width: 300,
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
