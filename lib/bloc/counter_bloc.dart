import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

// BLoC stands for BUSINESS LOGIC COMPONENT
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Bloc has Template Type <CounterEvent, CounterState>
  // This means that this bloc will handle events of type CounterEvent 
  // and emit states of type CounterState.
  CounterBloc() : super(const CounterState(counter: 0)) {
    on<IncrementCounterEvent>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });

    on<DecrementCounterEvent>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
