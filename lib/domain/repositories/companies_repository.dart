import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_graphql/core/error/failure.dart';
import 'package:flutter_advanced_graphql/domain/entities/company_list/company_list.dart';

abstract class CompaniesRepository {
  Future<Either<Failure, CompanyList>> getCompanies();
}