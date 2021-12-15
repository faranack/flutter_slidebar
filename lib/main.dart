import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slidebar_hn/bloc/counter_bloc.dart';
import 'package:slidebar_hn/bloc/theme_bloc.dart';
import 'package:slidebar_hn/slideBarLayout.dart';

void main() {
  runApp(const MyApp());
}
//aaaaaa
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
              create: (BuildContext context)=>CounterBloc(),
          ),
          BlocProvider<ThemeBloc>(
            create: (BuildContext context)=>ThemeBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc,ThemeData>(builder: (context, ThemeData ThemeData){
          return MaterialApp(
            title: 'Sidebar',
            debugShowCheckedModeBanner: false,
            theme: ThemeData,
            home: SlideBarLayout(),
          );
        },),
    );
  }
}

