import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:kiriminaja_test/blocs/example/network_bloc.dart';
import 'package:kiriminaja_test/helper/network_helper.dart';

final sLocator = GetIt.instance;
void init() {
  //Core - Network
  sLocator.registerFactory(() => NetworkBloc(networkInfo: sLocator()));

  sLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: sLocator()));

  // EXTERNAL

  sLocator.registerLazySingleton(() => Connectivity());
}
