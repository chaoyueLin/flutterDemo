import 'dart:async';
import 'dart:isolate';

void test1() {
  Future f1 = Future(() => null);
  Future f3 = Future(() => null);
  Future f2 = Future(() => null);

  f1.then((_) => print("f1 -> f1"));
  f3.then((_) {
    print("f3 -> f3");
    f2.then((_) => print("f3.then -> f1"));
  });
  f2.then((_) => print("f2 -> f2"));
}

void test2() {
  print('main 1');
  scheduleMicrotask(() => print('microtask 1'));

  new Future.delayed(new Duration(seconds: 1), () => print('future 1'));

  new Future(() => print('future 2'))
      .then((_) => print('future #2.1'))
      .then((_) {
    print('future #2.2');
    scheduleMicrotask(() => print('microtask 4'));
  }).then((_) => print('future #2.3'));

  scheduleMicrotask(() => print('microtask 2'));

  new Future(() => print('future 3'))
      .then((_) => new Future(() => print('future #3.1 new')))
      .then((_) => print('future #3.2'));

  new Future(() => print('future 4'));
  scheduleMicrotask(() => print('microtask 3'));
  print('main 2');
}

void main() async {
  test2();
}
