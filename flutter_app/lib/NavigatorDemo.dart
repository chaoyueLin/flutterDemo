import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
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
      routes: {
        "second_page": (context) => SecondPage(),
      },
      //错误路由处理，统一返回UnknownPage
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => UnknownPage()),
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
  _FirstPageState createState() => _FirstPageState();
}





class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String msg = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Second"),
        ),
        body: Column(
            children: <Widget>[
              Text('Message from first screen: $msg'),
              RaisedButton(
                  child: Text('back'),
                  //页面关闭时传递参数
                  onPressed: ()=> Navigator.pop(context,"Hi")
              )
            ]
        ));
  }
}





class _FirstPageState extends State<MyHomePage> {
  String _msg='';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text('命名路由（参数&回调）'),
          //打开页面，并监听页面关闭时传递的参数
          onPressed: ()=> Navigator.pushNamed(context, "second_page",arguments: "Hey").then((msg)=>setState(()=>_msg=msg)),
        ),
        Text('Message from Second screen: $_msg'),

      ],),
    );
  }
}
class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('unknown'),
        // 回退页面
        onPressed: () => Navigator.pop(context));
  }
}
