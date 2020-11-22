import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color textColor;
  final Color shadowColor;
  final double height;
  final double width;
  final EdgeInsets margin;
  final bool showShadow;

  CustomButton({
    @required this.text,
    @required this.onTap,
    this.width,
    this.backgroundColor = Colors.deepOrange,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.all(10.0),
    this.margin = EdgeInsets.zero,
    this.showShadow = true,
    this.height = 40,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: this.height,
        width: this.width,
        margin: this.margin,
        padding: this.padding,
        decoration: BoxDecoration(
          color: this.backgroundColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.deepOrange),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: this.shadowColor ?? this.backgroundColor,
                    blurRadius: 5,
                  )
                ]
              : null,
        ),
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: this.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
