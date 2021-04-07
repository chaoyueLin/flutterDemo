import 'dart:async';
import 'dart:io';

import 'dart:isolate';

import 'package:flutter/foundation.dart';

getData() async {
  int result = await Future.delayed(Duration(milliseconds: 2000), () {
    return Future.value(123);
  });
  print('t3:' + DateTime.now().toString() + ",result=" + result.toString());
}

void testFutureCreate3() {
  Future f1 = new Future(() => null);
  Future f2 = new Future(() => null);
  Future f3 = new Future(() => null);

  f3.then((_) => print("3"));
  f1.then((_) => print("1"));
  f2.then((_) => print("2"));
}
void testThen1() {
  Future f1 = new Future(() => null);
  Future f2 = new Future(() => null);
  Future f3 = new Future(() => null);

  f1.then((_) => print("f1 -> f1"));
  // f2 then 异步回调里面还有异步回调
  f2.then((_) {
    print("f2 -> f2");
    f1.then((_) => print("f2.then -> f1"));
  });
  f3.then((_) => print("f3 -> f3"));
}

void testThen4() {
  Future f1 = new Future(() => null);
  Future f2 = new Future(() => null);
  Future f3 = new Future(() => null);

  f1.then((_) => print("f1 -> f1"));
  f2.then((_) {
    print("f3 -> f3");
    new Future(() => print("f3.then -> new Future"));
    f1.then((_) => print("f3.then -> f1"));
  });
  f3.then((_) => print("f2 -> f2"));
}
main() async {
  // print('t1:' + DateTime.now().toString());
  // getData();
  // print('t2:' + DateTime.now().toString());

  // testFutureCreate3();
  // testThen1();
  // testThen4();

//
//   Future(() => print('f1'));//声明一个匿名Future
//   Future fx = Future(() =>  null);//声明Future fx，其执行体为null
//
// //声明一个匿名Future，并注册了两个then。在第一个then回调里启动了一个微任务
//   Future(() => print('f2')).then((_) {
//     print('f3');
//     scheduleMicrotask(() => print('f4'));
//   }).then((_) => print('f5'));
//
// //声明了一个匿名Future，并注册了两个then。第一个then是一个Future
//   Future(() => print('f6'))
//       .then((_) => Future(() => print('f7')))
//       .then((_) => print('f8'));
//
// //声明了一个匿名Future
//   Future(() => print('f9'));
//
// //往执行体为null的fx注册了了一个then
//   fx.then((_) => print('f10'));
//
// //启动一个微任务
//   scheduleMicrotask(() => print('f11'));
//   print('f12');


  // print("func before");
  // func();
  // print("func after");x

  startOtherIsolate();
}


//声明了一个延迟2秒返回Hello的Future，并注册了一个then返回拼接后的Hello 2019
Future<String> fetchContent() =>
    Future<String>.delayed(Duration(seconds:2), () => "Hello")
        .then((x) => "$x 2019");
//异步函数会同步等待Hello 2019的返回，并打印
func() async => print(await fetchContent());






var anotherIsolate;
var value = "Now Thread!";

void startOtherIsolate() async {
  var receivePort = ReceivePort();
  var sendPort;

  anotherIsolate = await Isolate.spawn(otherIsolateInit, receivePort.sendPort);

  receivePort.listen((date) {
    if (date is SendPort) {
      sendPort = date as SendPort;
      print("双向通讯建立成功");
      return;
    }
    print("Isolate 1 接受消息：data = $date");
    sendPort.send("AA");
  });
}

void otherIsolateInit(SendPort sendPort) async {
  value = "Other Thread!";

  var receivePort = ReceivePort();
  print("Isolate 2 接受到来自 Isolate 1的port，尝试建立同 Isolate 1的双向通讯");

  receivePort.listen((date) {
    print("Isolate 2 接受消息：data = $date");
  });

  sendPort.send(receivePort.sendPort);

  for (var index = 0; index < 10; index++) {
    sendPort.send("BB$index");
  }
}


void newTask() async {
  print("开始耗时计算，当前 isolate = ${Isolate.current.toString()}");
  var result = await compute(getName, "name");
  print(result);
}

String getName(String name) {
  print("正在获取结果中...,当前 isolate = ${Isolate.current.toString()}");
  sleep(Duration(seconds: 2));
  return "Name";
}



