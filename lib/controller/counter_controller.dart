import 'package:flutter_app_no_plugin/model/counter_model.dart';
import 'package:flutter_app_no_plugin/repository/counter/counter_repository.dart';

typedef void OnResponseResultHandler(CounterModel counter);

typedef void OnResponseErrorHandler();

class CounterController {
  OnResponseResultHandler _onResponseResultHandler;

  OnResponseErrorHandler _onResponseErrorHandler;

  static final CounterController _controller = CounterController._internal();

  factory CounterController() => _controller;

  CounterController._internal();

  final CounterRepository _repository = CounterRepository();

  void setResponseResultHandler(OnResponseResultHandler onResponseHandler) =>
      _onResponseResultHandler = onResponseHandler;
  void setResponseErrorHandler(OnResponseErrorHandler onResponseErrorHandler) =>
      _onResponseErrorHandler = onResponseErrorHandler;

  Future<void> fetchData() async {
    try {
      final response = await _repository.fetchData();

      _onResponseResultHandler(response);
    } catch (ex) {
      _onResponseErrorHandler();
    }
  }
}
