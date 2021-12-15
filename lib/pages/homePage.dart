import 'package:flutter/material.dart';
import 'dart:async';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//  
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: new Text("HomePage",style: new TextStyle(
//         fontSize: 27,
//         fontWeight: FontWeight.w900
//       ),),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  // Timer? _timer;
  int _start = 60;

  // void startTimer() {
  //   const oneSec = const Duration(seconds: 1);
  //   _timer =  Timer.periodic(
  //     oneSec,
  //         (Timer timer) {
  //       if (_start == 0) {
  //         setState(() {
  //           timer.cancel();
  //         });
  //       } else {
  //         setState(() {
  //           _start--;
  //         });
  //       }
  //     },
  //   );
  // }

  @override
  void dispose() {
    // _timer!.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer test")),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              // _start =60;
              //  startTimer();

            },
            child: Text("start"),
          ),
          Text("$_start")
        ],
      ),
    );
  }
}
