import '../my_project.dart';
import 'package:my_project/model/trade.dart';

class User extends ManagedObject<_User> implements _User {

  @override
  void readFromMap(Map<String, dynamic> requestBody) {
    email = requestBody["email"];
    password = requestBody["password"];
    nickname = requestBody["nickname"];
  }

  @override
  Map<String, dynamic> asMap() {
    return {
      "email": email,
      "password": password,
      "nickname": nickname
    };
  }

}

class _User {
  @managedPrimaryKey
  int index;

  @ManagedColumnAttributes(unique: true)
  String email;

  @ManagedColumnAttributes(omitByDefault: true)
  String password;

  @ManagedColumnAttributes(unique: true)
  String nickname;

  ManagedSet<Trade> trade;

  
}