import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class CounterCubit extends Bloc<CounterEvent, CounterState> {
  CounterCubit() : super(InitialCounter([0])) {
    on<IncrementCounter>((event, emit) {
      state.count.add(state.count.last + 1);
      emit(CounterIncremented(state.count));
    });
    on<DecrementCounter>((event, emit) {
      state.count.add(state.count.last - 1);
      emit(CounterDecremented(state.count));
    });
  }
}

abstract class CounterEvent extends Equatable {
  final List<int> count;

  CounterEvent(this.count);
  @override
  List<Object?> get props => [count];
}

class IncrementCounter extends CounterEvent {
  IncrementCounter(List<int> count) : super(count);
}

class DecrementCounter extends CounterEvent {
  DecrementCounter(List<int> count) : super(count);
}

abstract class CounterState extends Equatable {
  final List<int> count;

  CounterState(this.count);
  @override
  List<Object?> get props => [count];
}

class InitialCounter extends CounterState {
  InitialCounter(List<int> count) : super(count);
}

class CounterIncremented extends CounterState {
  CounterIncremented(List<int> count) : super(count);
}

class CounterDecremented extends CounterState {
  CounterDecremented(List<int> count) : super(count);
}
