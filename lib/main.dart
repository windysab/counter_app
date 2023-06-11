import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('MyHomePage dibuild');
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            print('Widget text dibuild ulang');
            return Text(
              '${state.counter}',
              style: const TextStyle(
                fontSize: 52.0,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              //#1 Counter Cubit
              BlocProvider.of<CounterCubit>(context).increment();

              //#2 Counter Bloc
              // BlocProvider.of<CounterBloc>(context)
              //     .add(CounterIncrementEvent());
            },
            child: const Icon(
              Icons.add,
              size: 24.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              //#Counter Cubit
              BlocProvider.of<CounterCubit>(context).decrement();
              //#2 Counter Bloc
              // BlocProvider.of<CounterBloc>(context)
              //     .add(CounterDecrementEvent());
            },
            child: const Icon(
              Icons.remove,
              size: 24.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
