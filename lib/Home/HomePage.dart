import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_stateapp/Home/details_screen.dart';
import 'package:riverpod_stateapp/dart_provider/data_provider.dart';

import '../Models/userModel.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _apiData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod data From Api"),
        centerTitle: true,
      ),
      body: _apiData.when(
        data: (_apiData) {
          List<UserModel> userDetails = _apiData.map((e) => e).toList();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: userDetails.length,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsScreen(e: userDetails[index]))),
                            child: Card(
                              color: Colors.blue,
                              elevation: 4,
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Text(userDetails[index].firstName),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(userDetails[index].lastName),
                                  ],
                                ),
                                subtitle: Text(userDetails[index].email),
                                trailing: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(userDetails[index].avatar),
                                ),
                              ),
                            ),
                          );
                        })),
              ],
            ),
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
            child: CircularProgressIndicator(
          color: Colors.blue,
        )),
      ),
    );
  }
}
