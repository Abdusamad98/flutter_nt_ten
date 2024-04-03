abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {
  final int value;


  IncrementEvent({required this.value});
}

class DecrementEvent extends CounterEvent {}
