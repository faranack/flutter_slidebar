import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slidebar_hn/bloc/navigation_bloc.dart';
import 'package:slidebar_hn/pages/homePage.dart';
import 'package:slidebar_hn/slide_bar.dart';


class SlideBarLayout extends StatefulWidget {
  const SlideBarLayout({Key? key}) : super(key: key);

  @override
  _SlideBarLayoutState createState() => _SlideBarLayoutState();
}

class _SlideBarLayoutState extends State<SlideBarLayout> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) =>new NavigationBloc(HomePage()),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc,Widget>(builder: (context,Widget widget){
              return widget;
            }),
            SlideBar(),
          ],

        ),
      ),
    ));
  }
}
