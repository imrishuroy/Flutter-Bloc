part of 'counter_cubit.dart';

class CounterState {
  // this is the state of the app
  int counterValue;
  bool wasIncremented;
  CounterState({
    @required this.counterValue,
    this.wasIncremented,
  });
}
