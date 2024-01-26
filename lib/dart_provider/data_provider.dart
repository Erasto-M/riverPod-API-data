import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_stateapp/Models/userModel.dart';
import 'package:riverpod_stateapp/Services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref)async {
  return ref.watch(userProvider).getUsers();
});