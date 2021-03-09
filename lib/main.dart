import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/cubit/counter_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterAppScreen(),
      ),
    );
  }
}

class CounterAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body:

          //  BlocListener<CounterCubit, CounterState>(
          //   listener: (context, state) {
          //     if (state.wasIncremented == true) {
          //       Scaffold.of(context).showSnackBar(SnackBar(
          //         content: Text('Incremented'),
          //         duration: Duration(milliseconds: 300),
          //       ));
          //     } else {
          //       Scaffold.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text('Decremented'),
          //           duration: Duration(milliseconds: 300),
          //         ),
          //       );
          //     }
          //   },
          //   child:

          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                '${state.counterValue}',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              );
            },
            listener: (context, state) {
              if (state.wasIncremented == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Incremented'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Decremented'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
