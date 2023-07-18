import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_demo/model/user_model.dart';

class ApiServices {
  String userUrl = 'https://reqres.in/api/users?page=2';
  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider = Provider<ApiServices>((ref) => ApiServices());
// final xyz = Provider<String>((ref) => 'Hi flutter');
