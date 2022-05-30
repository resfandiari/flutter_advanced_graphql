import 'package:flutter_advanced_graphql/domain/entities/company_list/company.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_list.freezed.dart';

@freezed
class CompanyList with _$CompanyList {
  const factory CompanyList({
    List<Company>? allCompanies,
  }) = _CompanyList;
}
