import 'package:artemis/artemis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced_graphql/core/service/internet_connection_service.dart';
import 'package:flutter_advanced_graphql/data/error/graph_ql_error.dart';
import 'package:flutter_advanced_graphql/data/error/no_internet_error.dart';
import 'package:gql_link/gql_link.dart' as graph_ql;
import 'package:json_annotation/json_annotation.dart' as json;

import 'package:flutter_advanced_graphql/data/graph_ql_link/mobile_graph_ql_link.dart'
    if (dart.library.html) 'package:flutter_advanced_graphql/data/graph_ql_link/web_graph_ql_link.dart'
    as graph_ql_link;

abstract class GraphApiProviderCore {
  late ArtemisClient _client;

  GraphApiProviderCore() {
    final graph_ql.Link link = graph_ql_link.getGraphQlLink();

    _client = ArtemisClient.fromLink(link);
  }

  @protected
  Future<T> execute<T, V extends json.JsonSerializable>(
    GraphQLQuery<T, V> query,
  ) async {
    try {
      final GraphQLResponse<T> response = await _client.execute<T, V>(query);
      final T? data = response.data;

      if (data != null) {
        return data;
      } else {
        throw GraphQLError(noData: true);
      }
    } catch (e) {
      if (!await InternetConnectionService.isConnected) {
        throw NoInternetError();
      } else {
        if ((e as graph_ql.ServerException).parsedResponse?.errors?.isNotEmpty ??
            false) {
          throw GraphQLError.message(
            message: e.parsedResponse?.errors?.first.message,
          );
        }
        rethrow;
      }
    }
  }
}
