import '../my_project.dart';
import 'user.dart';

class Trade extends ManagedObject<_Trade> implements _Trade {}

class _Trade {
  @managedPrimaryKey
  int index;

  String itemName;

  int quantity;

  double value;

  bool isSell;

  @ManagedRelationship(#trade)
  User user;
}