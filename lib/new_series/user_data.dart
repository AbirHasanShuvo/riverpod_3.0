import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/new_series/api_services.dart';
import 'package:riverpod_v3/new_series/user_model.dart';

//api provider
final apiProvider = Provider<ApiService>((ref) => ApiService());

//user provider
final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUser();
});

class UserData extends ConsumerWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(title: Text("User Data")),
      body: userData.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text("${data[index].firstname} ${data[index].lastname}"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data[index].avatar),
                ),
              );
            }),
          );
        },
        error: ((error, stacktrace) => Center(child: Text(error.toString()))),
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
