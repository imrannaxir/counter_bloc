part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

@immutable
class IncrementCounterEvent extends CounterEvent {}

@immutable
class DecrementCounterEvent extends CounterEvent {}

