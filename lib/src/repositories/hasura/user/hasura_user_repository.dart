import '../../../shared/models/user/user_model.dart';
import '../hasura_connection.dart';

class HasuraUserRepository extends HasuraConnection {
  Future<UserModel> getUser({String name, String password}) async {
    String query = """
      getUser(\$name:String!, \$password:String){
        users(where: {name: {_eq: \$name}, password: {_eq: \$password}}) {
          name
          id
        }
      }
    """;

    Map<String, dynamic> data = await hasuraConnect
        .query(query, variables: {"name": name, "password": password});
    if (data["data"]["users"].isEmpty) {
      return null;
    } else {
      return UserModel.fromJson(data["data"]["users"][0]);
    }
  }

  Future<UserModel> createUser({String name, String password}) async {
    String query = """
      mutation createUser(\$name:String!, \$password:String!) {
        insert_users(objects: {name: \$name, password: \$password}) {
          returning {
            id
          }
        }
      }
    """;

    Map<String, dynamic> data = await hasuraConnect
        .mutation(query, variables: {"name": name, "password": password});
    int id = data["data"]["insert_users"]["returning"][0]["id"];
    return UserModel(id: id, name: name);
  }

  @override
  void dispose() {
    hasuraConnect.dispose();
  }
}
