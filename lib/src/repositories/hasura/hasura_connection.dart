import 'package:hasura_connect/hasura_connect.dart';

abstract class HasuraConnection {
  HasuraConnect hasuraConnect =
      HasuraConnect("https://flutter-hasura-demo.herokuapp.com/v1/graphql");

  dispose();
}
