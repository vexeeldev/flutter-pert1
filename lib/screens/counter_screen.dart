import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter BLoC")),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              state.value.toString(),
              style: TextStyle(fontSize: 40),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(Increment()),
            child: Icon(Icons.add),
          ),

          SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(Decrement()),
            child: Icon(Icons.remove),
          ),

          SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(Reset()),
            child: Icon(Icons.refresh),
          ),

        ],
      ),
    );
  }
}