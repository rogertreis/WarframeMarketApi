import '../my_project.dart';
import 'package:my_project/model/trade.dart';

class User extends ManagedObject<_User> implements _User {}

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