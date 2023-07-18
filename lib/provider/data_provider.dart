import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/user_model.dart';
import 'package:riverpod_demo/services/api_services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUser();
});
