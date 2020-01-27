import 'package:flutter/material.dart';
import 'package:flutter_app_no_plugin/controller/counter_controller.dart';
import 'package:flutter_app_no_plugin/model/counter_model.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterController _counterController = CounterController();

  CounterModel counter = CounterModel(count: 0);

  final snackBar =
      SnackBar(content: Text('Error while trying to get the counter data'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("No Plugin Example"),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${counter.count}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    counter.increment();
                  });
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    counter.decrement();
                  });
                },
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
            )
          ],
        ));
  }

  @override
  void initState() {
    super.initState();

    _initCounter();
  }

  void _initCounter() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _counterController.setResponseResultHandler(_onCounterResponse);
      _counterController.setResponseErrorHandler(_onResponseError);

      _counterController.fetchData();
    });
  }

  void _onCounterResponse(CounterModel counter) {
    setState(() {
      this.counter = counter;
    });
  }

  void _onResponseError() {
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
