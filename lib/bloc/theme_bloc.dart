import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


enum ThemeEvents{
  toggle,
}

class ThemeBloc extends Bloc<ThemeEvents, ThemeData>{
  ThemeBloc() : super(ThemeData.light());
  @override
  Stream <ThemeData>mapEventToState(ThemeEvents event) async* {
  if (state==ThemeData.dark()){
    yield ThemeData.light();
  }else{
    yield ThemeData.dark();
  }
  }

}
