import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String url;
  final double borderRadius;
  final double imageWidth;
  final double imageHeight;
  final EdgeInsets padding;

  MyCachedNetworkImage({
    @required this.url,
    this.imageWidth,
    this.imageHeight,
    this.borderRadius = 0,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(this.borderRadius),
        child: CachedNetworkImage(
          height: this.imageHeight,
          width: this.imageWidth,
          imageUrl: this.url,
          fit: BoxFit.cover,
          placeholder: (context, _) => Shimmer.fromColors(
            child: Container(color: Colors.white),
            baseColor: Colors.white,
            highlightColor: Colors.grey,
          ),
          errorWidget: (context, _, __) => Icon(
            Icons.error,
            color: Colors.black,
            size: 50,
          ),
        ),
      ),
    );
  }
}
