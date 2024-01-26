import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_stateapp/Models/userModel.dart';
import 'package:riverpod_stateapp/dart_provider/data_provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.e});
  final UserModel e;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All details"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.id.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(e.firstName + e.lastName),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(e.email),
                    ],
                  ),
                ),
               const  Spacer(),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(e.avatar),
                ),
              ],
            ),
          ),
        ));
  }
}
