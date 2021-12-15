import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slidebar_hn/bloc/counter_bloc.dart';
import 'package:slidebar_hn/bloc/theme_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:new BlocBuilder<CounterBloc,int>(

          builder: (context, int myCount){
        return  Center(
          child: new Text("Counter is $myCount",style: new TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w900
          ),),
        );
      }
      ),
     floatingActionButton:
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             FloatingActionButton(
               onPressed: (){
                 BlocProvider.of<CounterBloc>(context).add(CounterEvents.increment);
                 BlocProvider.of<ThemeBloc>(context).add(ThemeEvents.toggle);
               },
               child: new Icon(Icons.add) ,
             ),
             SizedBox(width: 10,),
             FloatingActionButton(
               onPressed: (){
                 BlocProvider.of<CounterBloc>(context).add(CounterEvents.decrement);
                 // BlocProvider.of<ThemeBloc>(context).add(ThemeEvents.toggle);
               },
               child: new Icon(Icons.remove) ,
             ),
           ],
         )
    );
  }
}
