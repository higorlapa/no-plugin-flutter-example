class CounterModel {
  int count = 0;

  CounterModel({this.count}) : assert(count != null);

  increment() => count += 1;

  decrement() => count -= 1;
}
