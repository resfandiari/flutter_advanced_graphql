part of 'companies_bloc.dart';

@immutable
abstract class CompaniesState {
  const CompaniesState();
}

class CompaniesInitial extends CompaniesState {}

class CompaniesLoading extends CompaniesState {}

class CompaniesFailure extends CompaniesState {
  final Failure? serverError;

  const CompaniesFailure({
    required this.serverError,
  });
}

class CompaniesSuccess extends CompaniesState {
  final CompanyList allCompanies;

  const CompaniesSuccess({
    required this.allCompanies,
  });
}
