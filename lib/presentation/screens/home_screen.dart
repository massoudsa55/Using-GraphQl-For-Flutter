import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../core/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HttpLink httpLink = HttpLink(AppConstants.urlGraphql);

  void _initGraphql() {
    ValueNotifier<GraphQLClient> client =
        ValueNotifier(GraphQLClient(link: httpLink, cache: GraphQLCache()));
    GraphQLProvider(
      client: client,
      child: CacheProvider(child: FetchDataScreen()),
    );
  }

  @override
  void initState() {
    _initGraphql();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class FetchDataScreen extends StatelessWidget {
  const FetchDataScreen({super.key});
  Future<QueryResult> result(BuildContext context) async {
    QueryResult query = await GraphQLProvider.of(context)
        .value
        .query(QueryOptions(document: gql("""
query {
  characters(page: 2, filter: { name: "rick" }) {
    results {
      name
      image
    }
  }
}
""")));
    return query;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
