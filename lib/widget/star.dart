import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final int starCount;
  final double vote;

  Star(this.vote, {this.starCount = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Theme.of(context).primaryColor,
          size: 20.0,
        ),
        SizedBox(
          width: 3.0,
        ),
        Text(
          vote.toString() + "/10",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
