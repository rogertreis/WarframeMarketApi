import 'package:aqueduct/aqueduct.dart';   
import 'dart:async';

class Migration2 extends Migration { 
  @override
  Future upgrade() async {
   database.alterColumn("_User", "email", (c) {
c.isUnique = true;
});

database.alterColumn("_User", "nickname", (c) {
c.isUnique = true;
});


database.addColumn("_Trade", new SchemaColumn("isSell", ManagedPropertyType.boolean, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false), unencodedInitialValue: 'false');



  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    