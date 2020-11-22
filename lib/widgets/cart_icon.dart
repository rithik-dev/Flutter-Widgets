import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  final int count;

  const CartIcon({this.count = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            // go to cart
          },
          icon: Icon(Icons.shopping_cart),
        ),
        Positioned(
          top: 3,
          right: 3,
          child: CircleAvatar(
            radius: 9,
            backgroundColor: Colors.deepOrange,
            child: Text(
              this.count.toString(),
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }
}
