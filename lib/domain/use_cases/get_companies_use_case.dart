import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_graphql/core/error/failure.dart';
import 'package:flutter_advanced_graphql/core/usecase/usecase.dart';
import 'package:flutter_advanced_graphql/domain/entities/company_list/company_list.dart';
import 'package:flutter_advanced_graphql/domain/repositories/companies_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCompaniesUseCase implements UseCase<CompanyList, NoParams> {
  final CompaniesRepository repository;
  GetCompaniesUseCase(this.repository);

  @override
  Future<Either<Failure, CompanyList>> call({
    required NoParams params,
  }) async {
    return await repository.getCompanies();
  }
}