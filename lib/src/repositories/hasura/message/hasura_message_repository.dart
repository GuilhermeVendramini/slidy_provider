import 'package:hasura_connect/hasura_connect.dart';

import '../../../shared/models/message/message_model.dart';
import '../hasura_connection.dart';

class HasuraMessageRepository extends HasuraConnection {
  Stream<List<MessageModel>> getMessages() {
    var query = """
      subscription {
        messages(order_by: {id: desc}) {
          content
          id
          user {
            name
            id
          }
        }
      }
    """;

    Snapshot snapshot = hasuraConnect.subscription(query);
    return snapshot.stream.map(
      (jsonList) => MessageModel.fromJsonList(jsonList["data"]["messages"]),
    );
  }

  Future<dynamic> sendMessage({String message, int userId}) {
    var query = """
      sendMessage(\$message:String!,\$userId:Int!) {
        insert_messages(objects: {id_user: \$userId, content: \$message}) {
          affected_rows
        }
      }
    """;

    return hasuraConnect.mutation(query, variables: {
      "message": message,
      "userId": userId,
    });
  }

  @override
  void dispose() {
    hasuraConnect.dispose();
  }
}
