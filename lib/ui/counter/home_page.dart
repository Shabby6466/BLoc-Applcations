import 'package:blocexample/bloc/counter/counter_bloc.dart';
import 'package:blocexample/bloc/counter/counter_event.dart';
import 'package:blocexample/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Center(
              child: Text(
                state.counter.toString(),
                style: TextStyle(fontSize: 30),
              ),
            );
          }),
          ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(IncrementCounter());
              },
              child: const Center(
                child: Text("Increment"),
              )),
          ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(DecrementCounter());
              },
              child: const Center(
                child: Text("Decrement"),
              ))
        ],
      ),
    );
  }
}
