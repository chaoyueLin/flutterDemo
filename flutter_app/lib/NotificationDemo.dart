import 'package:flutter/material.dart';

class NotificationDemo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _msg = "通知：";

  @override
  Widget build(BuildContext context) {
    //监听通知
    return NotificationListener<CustomNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          }); //收到子Widget通知，更新msg
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(_msg), CustomChild()], //将子Widget加入到视图树中
        ));
  }
}

class CustomNotification extends Notification {
  CustomNotification(this.msg);

  final String msg;
}

//抽离出一个子Widget用来发通知
class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      //按钮点击时分发通知
      onPressed: () => CustomNotification("Hi").dispatch(context),
      child: Text("Fire Notification"),
    );
  }
}

