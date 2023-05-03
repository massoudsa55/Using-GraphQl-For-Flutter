import 'package:graphql_flutter/graphql_flutter.dart';

import 'app_constants.dart';

class GraphQLConfig {
  HttpLink httpLink = HttpLink(AppConstants.urlGraphql);
  GraphQLClient clientToQuery() =>
      GraphQLClient(link: httpLink, cache: GraphQLCache());
}
