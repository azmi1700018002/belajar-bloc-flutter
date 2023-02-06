part of 'example_bloc.dart';

abstract class ExampleState extends Equatable {
  const ExampleState();
}

class ExampleInitial extends ExampleState {
  @override
  List<Object> get props => [];
}

class ExampleStateLoading extends ExampleState {
  @override
  List<Object> get props => [];
}

class ExampleStateFailed extends ExampleState {
  final String text;
  const ExampleStateFailed(this.text);
  @override
  List<Object> get props => [text];
}

class ExampleStateLoaded extends ExampleState {
  final Example data;
  const ExampleStateLoaded(this.data);
  @override
  List<Object> get props => [data];
}