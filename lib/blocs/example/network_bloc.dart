import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kiriminaja_test/helper/network_helper.dart';
part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final NetworkInfo networkInfo;
  NetworkBloc({required this.networkInfo}) : super(NetworkInfoInitial()) {
    on<NetworkEvent>((event, emit) async {
      final connectionStatusStream =
          networkInfo.isConnected.asBroadcastStream();

      await emit.forEach(connectionStatusStream,
          onData: (bool isConnected) =>
              isConnected ? NetworkInfoConnected() : NetworkInfoNotConnected());
    });
  }
}
