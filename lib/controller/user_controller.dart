import '../my_project.dart';
import 'package:my_project/model/user.dart';

class UserController extends HTTPController {

  @httpPost
  Future<Response> authUser(@HTTPBody() String email, String password) async {
    var query = new Query<User>()
    ..where.email = whereEqualTo(email);

    var user = await query.fetchOne();

    if(user == null) {
      return new Response.notFound(body: 'Usuário incorreto.');
    } 
    else if(password != user.password){
      return new Response.notFound(body: 'Senha incorreta.');
    }

    return new Response.ok(true);
  }

  @httpPost
  Future<Response> addUser(@HTTPBody() String email, String password, String nickname) async {

    User u = new User();
    u.email = email;
    u.password = password;
    u.nickname = nickname;
    
    var query = new Query<User>()..values = u;
    return new Response.ok(await query.insert());
  }
}