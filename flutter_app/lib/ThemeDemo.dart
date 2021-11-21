import 'package:flutter/material.dart';

class ThemeDemo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
// 新建主题

// iOS浅色主题
    final ThemeData kIOSTheme = ThemeData(
        brightness: Brightness.light,//亮色主题
        accentColor: Colors.white,//(按钮)Widget前景色为白色
        primaryColor: Colors.blue,//主题色为蓝色
        iconTheme:IconThemeData(color: Colors.grey),//icon主题为灰色
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))//文本主题为黑色
    );
// Android深色主题
    final ThemeData kAndroidTheme = ThemeData(
        brightness: Brightness.dark,//深色主题
        accentColor: Colors.black,//(按钮)Widget前景色为黑色
        primaryColor: Colors.cyan,//主题色Wie青色
        iconTheme:IconThemeData(color: Colors.blue),//icon主题色为蓝色
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.red))//文本主题色为红色
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: kAndroidTheme,
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

            child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/loading.jpg',
              width: 100,
              height: 100,
            ),
            FadeInImage.assetNetwork(
                placeholder: 'images/loading.jpg',
                image:
                    'https://ss1.baidu.com/-4o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/e1fe9925bc315c6018d230188cb1cb1348547785.jpg')
          ],
        )));
  }
}
