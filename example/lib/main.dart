import 'package:easy_toast/easy_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Easy toast example app'),
        ),
        body: Center(
            child: CupertinoButton(
              pressedOpacity: 0.7,
              child: Container(
                width: 120,
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("测试", style: TextStyle(color: Colors.white),),
              ),
              onPressed: () {
                easyToast.info(context, "A easy toast!!!");
              },
            )),
      ),
    );
  }
}
