import 'package:flutter_advanced_graphql/data/graph_ql/graphql_api.dart';
import 'package:injectable/injectable.dart';
import 'graph_api_provider_core.dart';

@lazySingleton
class GraphApiProvider extends GraphApiProviderCore {

  Future<GetCompaniesData$Query> getCompanies() async {
    final GetCompaniesData$Query response = await execute(
      GetCompaniesDataQuery(),
    ).timeout(const Duration(seconds: 10));
    return response;
  }
}
