import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });
    on<CounterDecrementEvent>(
        (event, emit) => emit(state.copyWith(counter: state.counter - 1)));
  }
}
