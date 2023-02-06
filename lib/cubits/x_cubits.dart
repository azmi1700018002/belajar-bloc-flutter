import 'package:flutter_bloc/flutter_bloc.dart';

/// createdby Daewu Bintara
/// Sunday, 04/12/22 15:34
/// Enjoy coding ☕

class CounterCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  CounterCubit() : super(0);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);
}
