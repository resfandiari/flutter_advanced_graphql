part of 'companies_bloc.dart';

@immutable
abstract class CompaniesEvent {
  const CompaniesEvent();
}

class FetchCompanies extends CompaniesEvent {}
