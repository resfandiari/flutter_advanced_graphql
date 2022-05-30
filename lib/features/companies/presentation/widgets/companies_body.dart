import 'package:flutter/material.dart';
import 'package:flutter_advanced_graphql/features/companies/presentation/manager/companies_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesBody extends StatelessWidget {
  const CompaniesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Companies Page'),
        ),
        body: BlocBuilder<CompaniesBloc, CompaniesState>(
          builder: (context, state) {
            if (state is CompaniesFailure) {
              return Center(
                child: Text(
                  state.serverError?.errorMessage.toString().toUpperCase() ??
                      '',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (state is CompaniesSuccess) {
              final data = state.allCompanies.allCompanies;

              if (data?.isEmpty ?? true) {
                return const Center(child: Text('No data'));
              }

              return ListView.builder(
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(data?[index].name ?? ''),
                    subtitle: Text(data?[index].industry ?? ''),
                  );
                },
                itemCount: data?.length ?? 0,
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
