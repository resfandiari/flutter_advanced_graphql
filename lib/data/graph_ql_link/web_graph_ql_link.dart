import 'package:flutter_advanced_graphql/core/host.dart';
import 'package:flutter_advanced_graphql/data/graph_ql_link/app_interceptor.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:http/browser_client.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:gql_link/gql_link.dart';

Link getGraphQlLink() {
  return HttpLink(
    'http://$host:9002/graphql',
    httpClient: InterceptedClient.build(
      interceptors: <InterceptorContract>[
        AppInterceptor(),
      ],
      client: BrowserClient()..withCredentials = true,
    ),
  );
}
