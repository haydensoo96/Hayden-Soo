import 'package:flutter/material.dart';
import 'package:flutter_app_1/constants.dart';
import 'categories.dart';
import 'package:flutter_app_1/models/Product.dart';
import 'package:binder/binder.dart';

class Binder extends StatelessWidget {
  const Binder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BinderScope(child: MaterialApp(home: CounterView()));
  }
}

final counterRef = StateRef(0);

final counterViewLogicRef = LogicRef((scope) => CounterViewLogic(scope));

class CounterViewLogic {
  write(StateRef<int> counterRef, param1) {}
  read(StateRef<int> counterRef) {}

  const CounterViewLogic(Scope scope);
  void increment() => write(counterRef, read(counterRef) + 1);
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = context.watch(counterRef);

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.use(counterViewLogicRef).increment(),
        tooltip: 'Increment',
      ),
    );
  }
}
