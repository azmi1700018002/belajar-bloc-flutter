// ignore_for_file: unused_import, library_prefixes

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiriminaja_test/blocs/example/users_bloc.dart';
import 'package:kiriminaja_test/blocs/example/users_event.dart';
import 'package:kiriminaja_test/blocs/example/users_state.dart';
import 'package:kiriminaja_test/blocs/example/network_bloc.dart';
import 'package:kiriminaja_test/models/users_model.dart';
import 'package:kiriminaja_test/helper/injector.dart' as Injector;

class PhotosScreen extends StatefulWidget {
  static const routeName = 'photos_screen';
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  //Memanggil Event Tanpa di Klik
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<NetworkBloc>(context).add(const NetworkEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos"),
      ),
      // TODO : remove and replace the body's widget with your own created widget to showing data from API
      body: BlocListener<NetworkBloc, NetworkState>(
        listener: (context, state) {
          if (state is NetworkInfoNotConnected) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('No connection'),
              duration: const Duration(days: 1),
              backgroundColor: Theme.of(context).colorScheme.error,
            ));
            //Untuk Memanggil Event Pada UserBloc
            context.read<UserBloc>().add(LoadUserEvent());
          } else if (state is NetworkInfoConnected) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            context.read<UserBloc>().add(LoadUserEvent());
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<UserModel> userList = state.users;
              return ListView.builder(
                  itemCount: 10,
                  // userList.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Card(
                          color: Theme.of(context).primaryColor,
                          child: ListTile(
                              title: Text(
                                '${userList[index].id.toString()}  ${userList[index].albumId.toString()}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                '${userList[index].title}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  userList[index].thumbnailUrl.toString(),
                                ),
                              ))),
                    );
                  });
            }
            if (state is UserErrorState) {
              return const Center(
                child: Text("Silahkan Periksa Koneksi Internet Anda"),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
