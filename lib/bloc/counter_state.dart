part of 'counter_bloc.dart';

// abstract class CounterState extends Equatable {
//   const CounterState();

//   @override
//   List<Object> get props => [];
// }

// class CounterInitial extends CounterState {}

enum CounterStatus { initial, loading, succes, failuer }

class CounterState extends Equatable {
  const CounterState({
    required this.counterStatus,
    required this.counter,
    required this.error,
  });

  factory CounterState.initial() => const CounterState(
        counterStatus: CounterStatus.initial,
        counter: 0,
        error: '',
      );

  final int counter;
  final CounterStatus counterStatus;
  final String error;

  @override
  List<Object?> get props => [counterStatus, counter, error];

  CounterState copyWith({
    int? counter,
    CounterStatus? counterStatus,
    String? error,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      counterStatus: counterStatus ?? this.counterStatus,
      error: error ?? this.error,
    );
  }
}
