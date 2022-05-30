import 'package:flutter_advanced_graphql/data/graph_ql_link/app_interceptor.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:flutter_advanced_graphql/core/host.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:gql_link/gql_link.dart';


Link getGraphQlLink() {
  final HttpLink httpLink = HttpLink(
    'http://$host:9002/graphql',
    httpClient: InterceptedClient.build(
      interceptors: <InterceptorContract>[
        AppInterceptor(),
      ],
    ),
  );

  return httpLink;
}
