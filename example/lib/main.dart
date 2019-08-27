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
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildButton("show loading", () {
                easyToast.loading(context);
              }),
              _buildButton("hide loading", () {
                easyToast.hide();
              }),
              _buildButton("text", () {
                easyToast.toast(context, "A easy toast!!!");
              }),
              _buildButton("success", () {
                easyToast.success(context, "A easy toast!!!");
              }),
              _buildButton("error", () {
                easyToast.error(context, "A easy toast!!!");
              }),
              _buildButton("info", () {
                easyToast.info(context, "A easy toast!!!");
              }),
              _buildButton("fail", () {
                easyToast.fail(context, "A easy toast!!!");
              }),
              _buildButton("custom", () {
                easyToast.custom(
                  context,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(120, 81, 255, 0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "这是自定义的toast",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) => CupertinoButton(
        pressedOpacity: 0.7,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: 240,
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPressed: onPressed,
      );
}
