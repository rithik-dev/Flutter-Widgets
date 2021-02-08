import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final double padding;
  final double height;
  final double width;
  final double borderWidth;
  final EdgeInsets margin;
  final Color borderColor;
  final Color backgroundColor;
  final double borderRadius;
  final Color shadowColor;
  final double elevation;

  const CustomContainer({
    @required this.child,
    this.onTap,
    this.height,
    this.width,
    this.margin,
    this.borderColor,
    this.shadowColor,
    this.padding = 10,
    this.borderRadius = 5,
    this.borderWidth = 1,
    this.backgroundColor,
    this.elevation = 5,
  });

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  double _elevation;

  @override
  void initState() {
    _elevation = widget.elevation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.widget.height,
      width: this.widget.width,
      child: Card(
        shape: RoundedRectangleBorder(
          side: this.widget.borderColor != null
              ? BorderSide(
                  color: this.widget.borderColor,
                  width: this.widget.borderWidth)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(this.widget.borderRadius),
        ),
        color: this.widget.backgroundColor ?? Theme.of(context).accentColor,
        elevation: _elevation,
        margin: this.widget.margin,
        shadowColor: this.widget.shadowColor ?? Theme.of(context).accentColor,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: this.widget.onTap,
          onHighlightChanged: (v) {
            if (widget.elevation == 0)
              return;
            else if (widget.elevation <= 2.5)
              _elevation = v ? 0 : widget.elevation;
            else
              _elevation = v ? 2.5 : widget.elevation;
            setState(() {});
          },
          child: Padding(
            padding: EdgeInsets.all(this.widget.padding),
            child: this.widget.child,
          ),
        ),
      ),
    );
  }
}
