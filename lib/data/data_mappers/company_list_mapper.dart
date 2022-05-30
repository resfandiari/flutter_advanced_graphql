import 'package:flutter_advanced_graphql/data/graph_ql/graphql_api.graphql.dart';
import 'package:flutter_advanced_graphql/domain/entities/company_list/company.dart';
import 'package:flutter_advanced_graphql/domain/entities/company_list/company_list.dart';

extension CompanyListMapper on GetCompaniesData$Query {
  CompanyList toEntity() => CompanyList(
      allCompanies: allCompanies
          ?.map((e) => Company(
                id: e.id,
                name: e.name,
                industry: e.industry,
              ))
          .toList());
}
