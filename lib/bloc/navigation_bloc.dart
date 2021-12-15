import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:slidebar_hn/pages/counterPage.dart';
import 'package:slidebar_hn/pages/homePage.dart';
import 'package:slidebar_hn/pages/myorderPage.dart';
import 'package:slidebar_hn/pages/wishListPage.dart';
import 'package:slidebar_hn/pages/http_request.dart';



enum NavigationEvents{
  HomePageClickEvent,
  MyOrderPageClickEvent,
  WishListPageClickEvent,
  CounterPageClickEvent,
  HttpRequestClickEvent,
}

class NavigationBloc extends Bloc<NavigationEvents, Widget>{
  NavigationBloc(HomePage homePage) : super(HomePage());
@override
  Stream<Widget> mapEventToState(NavigationEvents event) async* {
  if (event == NavigationEvents.HomePageClickEvent) {
    yield const HomePage();
  }
  else if (event == NavigationEvents.MyOrderPageClickEvent) {
    yield const MyOrder();
  }
  else if (event == NavigationEvents.WishListPageClickEvent) {
    yield const WishList();
  }
  else if (event == NavigationEvents.CounterPageClickEvent) {
    yield const CounterPage();
  }
  else if (event == NavigationEvents.HttpRequestClickEvent) {
    yield const HttpRequest(title: 'Http Request',);
  }
}
}