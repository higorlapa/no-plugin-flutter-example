import 'package:flutter_app_no_plugin/model/counter_model.dart';

class CounterRepository {
  Future<CounterModel> fetchData() async {
    return CounterModel(count: 50);
  }
}
