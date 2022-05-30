import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_advanced_graphql/core/error/failure.dart';
import 'package:flutter_advanced_graphql/core/usecase/usecase.dart';
import 'package:flutter_advanced_graphql/domain/entities/company_list/company_list.dart';
import 'package:flutter_advanced_graphql/domain/use_cases/get_companies_use_case.dart';
import 'package:meta/meta.dart';

part 'companies_event.dart';

part 'companies_state.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesState> {
  late final GetCompaniesUseCase _getCompaniesUseCase;

  CompaniesBloc({
    required GetCompaniesUseCase getCompaniesUseCase,
  }) : super(CompaniesInitial()) {
    /// Assign value
    _getCompaniesUseCase = getCompaniesUseCase;

    /// Handle bloc events
    on<FetchCompanies>(_handleFetchAddressListEvent);
  }

  Future<void> _handleFetchAddressListEvent(
    FetchCompanies event,
    Emitter<CompaniesState> emit,
  ) async {
    emit(CompaniesLoading());

    final failureOrData = await _getCompaniesUseCase(params: NoParams());
    failureOrData.fold(
      (failure) => emit(CompaniesFailure(serverError: failure)),
      (data) => emit(
        CompaniesSuccess(allCompanies: data),
      ),
    );
  }
}
