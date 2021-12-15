import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';


enum CounterEvents{
  increment,
  decrement,
}

class CounterBloc extends Bloc<CounterEvents, int>{
  CounterBloc() : super(0);
  @override
  Stream <int>mapEventToState(CounterEvents event) async* {
    if(event==CounterEvents.increment){
      yield state+1;

    }else{
      yield state-1;
    }
  }

}
