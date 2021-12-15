import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slidebar_hn/bloc/navigation_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'components/responsive/responsive.dart';
import 'menuItem.dart';

class SlideBar extends StatefulWidget {
  const SlideBar({Key? key}) : super(key: key);

  @override
  _SlideBarState createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar>
    with SingleTickerProviderStateMixin {
  bool isSlideBarOpen = false;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;

    if (Responsive.isMobile(context)) {
      screenwidth = screenwidth * 0.6;
    } else {
      screenwidth = screenwidth * 0.3;
    }
    return AnimatedPositioned(
        right: !isSlideBarOpen ? -screenwidth : 0,
        // left: 430 ,
        duration: Duration(milliseconds: 700),
        child: Row(
          children: [
            Container(
              width: screenwidth,
              height: screenheight,
              color: Color(0xff262aaa),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  ListTile(
                    title: Text("MyApp",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800)),
                    subtitle: Text(
                      "codeflow.ir",
                      style: TextStyle(color: Color(0xff1bb5fd), fontSize: 15),
                    ),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.perm_identity,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                    height: 65,
                    color: Colors.white.withOpacity(0.5),
                    indent: 32,
                  ),
                  MenuItem(
                    icon: Icons.home,
                    title: "Home",
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.HomePageClickEvent);
                      // context.bloc<NavigationBloc>().add(NavigationEvents.HomePageClickEvent);
                      setState(() {
                        isSlideBarOpen = !isSlideBarOpen;
                      });
                    },
                  ),
                  MenuItem(
                    icon: Icons.shopping_cart,
                    title: "My Order",
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.MyOrderPageClickEvent);

                      //context.bloc<NavigationBloc>().add(NavigationEvents.MyOrderPageClickEvent);
                      setState(() {
                        isSlideBarOpen = !isSlideBarOpen;
                      });
                    },
                  ),
                  MenuItem(
                    icon: Icons.card_giftcard,
                    title: "WishList",
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.WishListPageClickEvent);
                      //context.Bloc<NavigationBloc>().add(NavigationEvents.WishListPageClickEvent);

                      setState(() {
                        isSlideBarOpen = !isSlideBarOpen;
                      });
                    },
                  ),
                  BlocBuilder<CounterBloc, int>(
                      builder: (context, int myCount) {
                    return MenuItem(
                      icon: Icons.card_giftcard,
                      title: "CounterPage $myCount",
                      onTap: () {
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigationEvents.CounterPageClickEvent);
                        //context.Bloc<NavigationBloc>().add(NavigationEvents.WishListPageClickEvent);

                        setState(() {
                          isSlideBarOpen = !isSlideBarOpen;
                        });
                      },
                    );
                  }),
                  MenuItem(
                    icon: Icons.airplanemode_active,
                    title: "httpRequest",
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.HttpRequestClickEvent);
                      //context.Bloc<NavigationBloc>().add(NavigationEvents.WishListPageClickEvent);

                      setState(() {
                        isSlideBarOpen = !isSlideBarOpen;
                      });
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSlideBarOpen = !isSlideBarOpen;
                });
              },
              child: Align(
                alignment: Alignment(0, -0.5),
                child: ClipPath(
                  clipper: customMenuClipper(),
                  child: Container(
                    width: 70,
                    height: 250,
                    alignment: Alignment.center,
                    child: AnimatedIcon(
                        color: Color(0xff1eb5fd),
                        icon: isSlideBarOpen
                            ? AnimatedIcons.close_menu
                            : AnimatedIcons.menu_close,
                        progress: _animationController.view),
                    color: Color(0xff262aaa),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class customMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(width, 0);
    path.quadraticBezierTo(width, 8, width - 10, 16);
    path.quadraticBezierTo(0, width, 0, height / 2);
    path.quadraticBezierTo(0, height - width, width - 10, height - 16);
    path.quadraticBezierTo(width, height - 8, width, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
