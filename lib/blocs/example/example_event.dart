part of 'example_bloc.dart';

abstract class ExampleEvent extends Equatable {
  const ExampleEvent();
}

class ExampleEventLoadData extends ExampleEvent {
  @override
  List<Object?> get props => [];
}