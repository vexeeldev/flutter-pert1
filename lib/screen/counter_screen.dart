import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Counter Provider")),
      body: Center(
        child: Text(
          counter.value.toString(),
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            onPressed: () => counter.increment(),
            child: Icon(Icons.add),
          ),

          SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () => counter.decrement(),
            child: Icon(Icons.remove),
          ),

          SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () => counter.reset(),
            child: Icon(Icons.refresh),
          ),

        ],
      ),
    );
  }
}