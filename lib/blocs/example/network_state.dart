part of 'network_bloc.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object> get props => [];
}

class NetworkInfoInitial extends NetworkState {}

class NetworkInfoConnected extends NetworkState {}

class NetworkInfoNotConnected extends NetworkState {}
