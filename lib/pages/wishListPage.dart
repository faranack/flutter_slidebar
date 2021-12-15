import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Text("WishList",style: new TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.w900
      ),),
    );
  }
}
