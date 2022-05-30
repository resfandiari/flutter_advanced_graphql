// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api_provider/graph_api_provider.dart' as _i4;
import '../../data/repositories/companies_repository_impl.dart' as _i6;
import '../../domain/repositories/companies_repository.dart' as _i5;
import '../../domain/use_cases/get_companies_use_case.dart' as _i7;
import '../error/error_handler.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ErrorHandler>(() => _i3.ErrorHandler());
  gh.lazySingleton<_i4.GraphApiProvider>(() => _i4.GraphApiProvider());
  gh.lazySingleton<_i5.CompaniesRepository>(() => _i6.CompaniesRepositoryImpl(
      apiProvider: get<_i4.GraphApiProvider>(),
      errorHandler: get<_i3.ErrorHandler>()));
  gh.lazySingleton<_i7.GetCompaniesUseCase>(
      () => _i7.GetCompaniesUseCase(get<_i5.CompaniesRepository>()));
  return get;
}
