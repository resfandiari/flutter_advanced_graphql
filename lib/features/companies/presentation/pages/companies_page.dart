import 'package:flutter/material.dart';
import 'package:flutter_advanced_graphql/core/injection/injection.dart';
import 'package:flutter_advanced_graphql/domain/use_cases/get_companies_use_case.dart';
import 'package:flutter_advanced_graphql/features/companies/presentation/manager/companies_bloc.dart';
import 'package:flutter_advanced_graphql/features/companies/presentation/widgets/companies_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CompaniesBloc>(
          create: (_) => CompaniesBloc(
            getCompaniesUseCase: sl.get<GetCompaniesUseCase>(),
          )..add(FetchCompanies()),
        ),
      ],
      child: const ManageAddressView(),
    );
  }
}

class ManageAddressView extends StatelessWidget {
  const ManageAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CompaniesBody();
  }
}
