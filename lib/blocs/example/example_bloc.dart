import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kiriminaja_test/models/x_models.dart';

import '../../interfaces/example_interface.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {

  final ExampleInterface repo;
  ExampleBloc(this.repo) : super(ExampleInitial()) {

    on<ExampleEventLoadData>((event, emit) => _loadData(event, emit));

  }

  // load data from repository
  void _loadData(ExampleEventLoadData event, Emitter<ExampleState> emit) async {
    emit(ExampleStateLoading());
    try {
      var data = await repo.getFirstData();
      if (data == null) {
        emit(const ExampleStateFailed("no data found"));
      } else {
        emit(ExampleStateLoaded(data));
      }
    } catch (e) {
      emit(ExampleStateFailed(e.toString()));
    }
  }
}
