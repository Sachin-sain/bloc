import 'package:bloc_project/bloc/counter_bloc.dart';
import 'package:bloc_project/bloc/counter_events.dart';
import 'package:bloc_project/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example"),
      ),
      body:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterState>(builder: (context, state){
            return Center(child: Text(state.counter.toString(),style: const TextStyle(color: Colors.black,fontSize: 30),),);
          }
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
             context.read<CounterBloc>().add(IncrementCounter());
              },
                child: const Text('Increment'),
              ),
              ElevatedButton(onPressed: (){
              context.read<CounterBloc>().add(DecrementCounter());
              },
                child: const Text('Decrement'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
