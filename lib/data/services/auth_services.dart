import 'dart:convert';

import 'package:flutter_01_test/data/model/signin_form_model.dart';
import 'package:flutter_01_test/data/model/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../utils/base_url.dart';

class AuthServices {
  Future<UserModel> login(SignInFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body)["user"]);

        //Store to Local
        await storeCredentialToLocal(
          user,
          data.password!,
        );

        return user;
      } else {
        return jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    try {
      await removeDataLocal();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> storeCredentialToLocal(UserModel user, String password) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'uuid', value: user.uid);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'name', value: user.name);
      await storage.write(key: 'phoneNumber', value: user.phoneNumber);
      await storage.write(key: 'password', value: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInFormModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();
      if (values['email'] == null || values['password'] == null) {
        throw 'Authenticated';
      } else {
        final SignInFormModel data = SignInFormModel(
          email: values['email'],
          password: values['password'],
        );
        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeDataLocal() async {
    try {
      const storage = FlutterSecureStorage();
      await storage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }
}
