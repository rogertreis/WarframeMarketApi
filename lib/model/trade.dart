import '../my_project.dart';
import 'user.dart';

class Trade extends ManagedObject<_Trade> implements _Trade {

    @override
    void readFromMap(Map<String, dynamic> requestBody) {
      itemName = requestBody["itemName"];
      quantity = requestBody["quantity"];
      value = requestBody["value"];
      isSell = requestBody["isSell"];
      user.index = requestBody["userId"];
    }
  
    @override
    Map<String, dynamic> asMap() {
      return {
        "itemName": itemName,
        "quantity": quantity,
        "value": value,
        "isSell": isSell,
        "nickname": user.nickname
    };
  }
}

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