import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_graphql/core/error/error_handler.dart';
import 'package:flutter_advanced_graphql/core/error/failure.dart';
import 'package:flutter_advanced_graphql/data/api_provider/graph_api_provider.dart';
import 'package:flutter_advanced_graphql/data/data_mappers/company_list_mapper.dart';
import 'package:flutter_advanced_graphql/domain/entities/company_list/company_list.dart';
import 'package:flutter_advanced_graphql/domain/repositories/companies_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CompaniesRepository)
class CompaniesRepositoryImpl
    implements CompaniesRepository {
  final GraphApiProvider apiProvider;
  final ErrorHandler errorHandler;

  CompaniesRepositoryImpl({
    required this.apiProvider,
    required this.errorHandler,
  });

  @override
  Future<Either<Failure, CompanyList>> getCompanies() async {
    try {
    final data = await  apiProvider.getCompanies();
    return Right(data.toEntity());
    } on Exception catch (e) {
      final Failure serverError = errorHandler.proceed(e);
      return Left(serverError);
    }
  }
}
