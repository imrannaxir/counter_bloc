import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  //
  void _incrementCounter() {
    Provider.of<CounterBloc>(context, listen: false)
        .add(IncrementCounterEvent());
  }

  void _decrementCounter() {
    Provider.of<CounterBloc>(context, listen: false)
        .add(DecrementCounterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
        ),
        centerTitle: true,
      ),
      body: myHomePage(),
      floatingActionButton: myFloatingActionButton(),
    );
  }

  Widget myHomePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You Have Pushed This Button Many Times : ',
          ),
          BlocBuilder<CounterBloc, CounterState>(
            bloc: Provider.of<CounterBloc>(context, listen: false),
            builder: (context, state) {
              return Text(
                '${state.counter}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget myFloatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'INCREMENT',
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
        FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: 'DECREMENT',
          child: const Icon(
            Icons.remove,
            size: 32,
          ),
        ),
      ],
    );
  }
}
