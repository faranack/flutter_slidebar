// import 'package:flutter/material.dart';
//
// class MyOrder extends StatelessWidget {
//   const MyOrder({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: new Text("MyOrderPage",style: new TextStyle(
//         fontSize: 27,
//         fontWeight: FontWeight.w900
//       ),),
//     );
//   }
// }

import 'package:flutter/material.dart';

//void main() => runApp(const HeroApp());

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return const DetailScreen();
          // }
          // )
          // );
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Hero(
            tag: 'NavHero',
            child: Ink(
              decoration: ShapeDecoration(
                color: Colors.blue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.add,color: Colors.yellow,),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 2),
                          pageBuilder: (_, __, ___) => DetailScreen()),
                  //     MaterialPageRoute(builder: (context) {
                  //   return const DetailScreen();
                  // }
                  // )
                  );
                },
              ),
            ),

          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.threesixty),
              Hero(
                tag: 'NavHero',
                child: Ink(
                  decoration: ShapeDecoration(
                    color: Colors.blue,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add,color: Colors.yellow,),
                    onPressed: () {
                      Navigator.pop(context,
                        PageRouteBuilder(
                            transitionDuration: Duration(seconds: 2),
                            pageBuilder: (_, __, ___) => DetailScreen()),);
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}