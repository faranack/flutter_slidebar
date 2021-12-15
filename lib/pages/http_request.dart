import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpRequest extends StatefulWidget {
  const HttpRequest({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HttpRequest> createState() => _HttpRequestState();
}

class _HttpRequestState extends State<HttpRequest> {
  final myController = TextEditingController();
  var textValue = "خالی";
  final Map<String, String> mapHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Access-Control-Allow-Methods': '*',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': '*',
  };

  Future<String> _sendRequesttoServer() async {

    var bodyJson = json.encode({'name': myController.text});
    // print(bodyJson);
    var url = Uri.parse('http://localhost:4224/fara');
    final response = await http.post(url, body: bodyJson, headers: mapHeaders);
    print('Server respones: ${response.body}');

    setState(() {
      textValue = response.body.toString();
    });

    // return response
    if (response.statusCode == 200) {
      return response.toString();
    } else {
      return "response error ${response.statusCode}";
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 40,
              width: 300,
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'متن خود را وارد کنید',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed:
                  () {

                // setState(() {
                //   textValue = myController.text != '' ? myController.text : 'خالی';
                // });

                    _sendRequesttoServer();



                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //       // Retrieve the text the user has entered by using the
                //       // TextEditingController.
                //       content: Text(myController.text),
                //     );
                //   },
                // );
              },
              child: const Text('ارسال'),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              textValue,
            ),
          ],
        ),
      ),
    );
  }
}
