import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' hide Account;

class AppWriteAuthClient {
  static AppWriteAuthClient? _instance;

  late Client _client;
  late Account _account;

  AppWriteAuthClient._internal() {
    _client = Client(endPoint: 'http://192.168.37.74/v1')
        .setProject('63de9001636edb740ea6')
        .setSelfSigned();
    _account = Account(_client);
  }

  static AppWriteAuthClient? get instance {
    if (_instance == null) return _instance = AppWriteAuthClient._internal();
    return _instance;
  }

  Future signup({
    required String userID,
    required String name,
    required String email,
    required String password,
  }) async {
    return _account.create(
      userId: userID.isEmpty ? 'unique()' : userID,
      name: name,
      email: email,
      password: password,
    );
  }

  Future<Session> login({
    required String email,
    required String password,
  }) async {
    return  _account.createEmailSession(email: email, password: password);
  }

  // Future<UserData> knowUserLogin() async {
  //   User res = await _account.get();
  //   return UserData.fromMap(res);
  // }
  //
  // Future logout() async {
  //   await _account.deleteSessions();
  // }
  //
  // Future<UserData> updateName({
  //   required String name,
  // }) async {
  //   User res = await _account.updateName(name: name);
  //   return UserData.fromMap(res);
  // }
  //
  // Future<UserData> updateEmail({
  //   required String email,
  //   required String password,
  // }) async {
  //   User res = await _account.updateEmail(email: email, password: password);
  //   return UserData.fromMap(res);
  // }
  //
  // Future<UserData> updatePassword({
  //   required String password,
  //   required String oldpw,
  // }) async {
  //   User res = await _account.updatePassword(
  //     password: password,
  //     oldPassword: oldpw,
  //   );
  //   return UserData.fromMap(res);
  // }
}