import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePicture extends StatelessWidget {
  final String url;
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;

  ProfilePicture(
    this.url, {
    this.radius = 50.0,
    this.borderWidth = 0.0,
    this.borderColor = Colors.black,
    this.onPressed,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      onLongPress: this.onLongPress,
      child: CircleAvatar(
        backgroundColor: this.borderColor,
        radius: this.radius + this.borderWidth,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            width: this.radius * 2,
            height: this.radius * 2,
            imageUrl: this.url,
            placeholder: (context, url) => Shimmer.fromColors(
              child: CircleAvatar(radius: this.radius),
              baseColor: Colors.grey[400],
              highlightColor: Colors.white,
              period: Duration(milliseconds: 350),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
