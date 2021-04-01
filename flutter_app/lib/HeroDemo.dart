import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      //手势监听点击
      child: Hero(
          tag: 'hero', //设置共享tag
          child: Container(width: 100, height: 100, child: FlutterLogo())),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Page2())); //点击后打开第二个页面
      },
    ));
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
            tag: 'hero', //设置共享tag
            child: Container(width: 300, height: 300, child: FlutterLogo())));
  }
}
