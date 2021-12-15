import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final title;
  final icon;
  final onTap;
  const MenuItem({Key? key, required this.title, required this.icon, this.onTap}) : super(key: key);


  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListTile(
        onTap: widget.onTap ,
        title: new Text(widget.title,style: new TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
        trailing: new Icon(widget.icon,color: Colors.white,size: 25,),
      ),
    );
  }
}
