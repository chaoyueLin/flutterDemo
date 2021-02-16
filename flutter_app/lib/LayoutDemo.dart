import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
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
      home: _MyHomePageState(title: 'Flutter Demo Home Page'),
    );
  }
}

class _MyHomePageState extends StatelessWidget {
  _MyHomePageState({Key key, this.title}) : super(key: key);
  final String title;

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
        title: Text(title),
      ),
      body: StackText(),
    );
  }
}

class ContainerText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Container（容器）在UI框架中是一个很常见的概念，Flutter也不例外。'),
      padding: EdgeInsets.all(18.0),
      margin: EdgeInsets.all(44.0),
      width: 180.0,
      height: 240,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(flex: 1, child: Container(color: Colors.yellow, height: 60)),
        Container(
          color: Colors.red,
          width: 100,
          height: 180,
        ),
        Container(
          color: Colors.black,
          width: 60,
          height: 80,
        ),
        Expanded(
          flex: 1,
          child: Container(color: Colors.green, height: 60),
        )
      ],
    );
  }
}

class StackText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(color: Colors.yellow, width: 300, height: 300),
        Positioned(
          left: 18.0,
          top: 18.0,
          child: Container(color: Colors.green, width: 50, height: 50),
        ),
        Positioned(
          left: 18.0,
          top: 70.0,
          child: Text("Stack提供了层叠布局的容器"),
        )
      ],
    );
  }
}

class UpdateItemModel {
  String appIcon; //App图标
  String appName; //App名称
  String appSize; //App大小
  String appDate; //App更新日期
  String appDescription; //App更新文案
  String appVersion; //App版本
  //构造函数语法糖，为属性赋值
  UpdateItemModel(
      {this.appIcon,
      this.appName,
      this.appSize,
      this.appDate,
      this.appDescription,
      this.appVersion});
}

class UpdatedItem extends StatelessWidget {
  final UpdateItemModel model;

  final VoidCallback onPressed;
  UpdatedItem({Key key, this.model, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[buildBottom(context), buildTop(context)],
    );
  }

  Widget buildBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(model.appDescription),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("${model.appVersion} * ${model.appSize} MB"),
          )
        ],
      ),
    );
  }

  Widget buildTop(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              model.appIcon,
              width: 80,
              height: 80,
            ),
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              model.appName,
              maxLines: 1,
            ),
            Text(
              model.appDate,
              maxLines: 1,
            )
          ],
        )),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: FlatButton(
            child: Text('open'),
            onPressed: onPressed,
          ),
        )
      ],
    );
  }
}
