// ignore: implementation_imports, depend_on_referenced_packages
import 'package:gql/src/ast/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AppConstants {
  static const String urlGraphql = "https://rickandmortyapi.com/graphql";
  static DocumentNode documentNodeOfQueryOptions = gql("""
                            query {
                              characters(page: 2, filter: { name: "rick" }) {
                                results {
                                  name
                                  image
                                }
                              }
                            }
                           """);
}
