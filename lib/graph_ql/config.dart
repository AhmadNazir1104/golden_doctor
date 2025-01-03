import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlHelper {
  static HttpLink httpLink = HttpLink(
    // 'https://ethnicpk.myshopify.com/api/2024-01/graphql',       // Ethnic
    'https://outfitterspk.myshopify.com/api/2023-04/graphql',       //  Outfitter
    defaultHeaders: <String, String>{
      // 'X-Shopify-Storefront-Access-Token': '959eddd47869314e620a6d1e3d05f6f4',          // Ethnic
      'X-Shopify-Storefront-Access-Token': '661d092e6652cc3554a719370241dcb5',   //outfitter
      // 'X-Shopify-Storefront-Access-Token': '75e049669db9a451ebba44c7a193b3f1',
      'Accept': 'application/json'
    },
  );
  static Link linke = httpLink;
  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
    cache: GraphQLCache(),
    link: linke,
  ));

  GraphQLClient clientToQuery() {
    return GraphQLClient(link: linke, cache: GraphQLCache());
  }
}
