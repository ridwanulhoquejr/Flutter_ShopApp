// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color color;

  Badge({
    required this.child,
    required this.value,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color,
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              // value = how many items in the cart
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
