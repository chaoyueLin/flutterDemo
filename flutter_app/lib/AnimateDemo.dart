import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalAnimateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NormalAnimateState();
}

class _NormalAnimateState extends State<NormalAnimateWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  void initState() {
    super.initState();
    // 创建动画周期为1秒的AnimationController对象
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    //创建一条震荡曲线
    final CurvedAnimation curve =
    CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    // 创建从50到200线性变化的Animation对象
    // 普通动画需要手动监听动画状态，刷新UI
    // animation = Tween(begin: 50.0, end: 200.0).animate(curve)
    //   ..addListener(() => setState(() {}));


    //使用AnimatedLogo可以不用setState了
    animation = Tween(begin: 50.0, end: 200.0).animate(curve);

    // 启动动画,重复执行
    controller.repeat(reverse: true);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       home: Scaffold(
  //           body: Center(
  //               child: Container(
  //                 width: animation.value,
  //                 height: animation.value,
  //                 child: FlutterLogo(),
  //               ))));
  // }
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
          home: Scaffold(
              body: AnimatedLogo(animation: animation)//初始化AnimatedWidget时传入animation对象
          ));
  }

  @override
  void dispose() {
    // 释放资源
    controller.dispose();
    super.dispose();
  }
}


class AnimatedLogo extends AnimatedWidget {
  //AnimatedWidget需要在初始化时传入animation对象
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    //取出动画对象
    final Animation<double> animation = listenable;
    return Center(
        child: Container(
          height: animation.value,//根据动画对象的当前状态更新宽高
          width: animation.value,
          child: FlutterLogo(),
        ));
  }
}
