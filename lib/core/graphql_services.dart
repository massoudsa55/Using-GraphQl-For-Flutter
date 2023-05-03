import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_graphql_with_flutter/core/app_constants.dart';

import '../domain/models.dart';
import 'graphql_config.dart';

class GraphQlServices {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<Character>> getCharacters() async {
    try {
      QueryResult result = await client.query(
          QueryOptions(document: AppConstants.documentNodeOfQueryOptions));
      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? res = result.data?["characters"]["results"];
        if (res == null || res.isEmpty) {
          return [];
        }
        List<Character> characters =
            res.map((character) => Character.fromJson(character)).toList();
        return characters;
      }
    } catch (error) {
      return [];
    }
  }
}
