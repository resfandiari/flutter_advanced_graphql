import 'package:flutter/material.dart';
import 'package:flutter_advanced_graphql/core/injection/injection.dart';
import 'package:flutter_advanced_graphql/features/companies/presentation/pages/companies_page.dart';
import 'package:injectable/injectable.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initial dependency injection
  configureInjection(Environment.prod);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Advanced Graphql',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const CompaniesPage(),
    );
  }
}
