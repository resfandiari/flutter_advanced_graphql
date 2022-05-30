import 'dart:async';

import 'package:flutter_advanced_graphql/core/error/failure.dart';
import 'package:flutter_advanced_graphql/data/error/graph_ql_error.dart';
import 'package:flutter_advanced_graphql/data/error/no_internet_error.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ErrorHandler {
  Failure proceed(Exception exception) {
    if (exception is NoInternetError) {
      return Failure('no Internet');
    }if (exception is TimeoutException) {
      return Failure('timeout Error');
    }  else if (exception is GraphQLError) {
      return _proceedGraphQlError(exception);
    } else {
      return Failure('unknown Error');
    }
  }

  Failure _proceedGraphQlError(GraphQLError exception) {
    if (exception.noData) {
      return Failure(
        'server Error',
        errorCode: GraphQLError.NO_DATA_CODE,
      );
    }if (exception.hasMessage) {
      return Failure(
        exception.message ?? 'server Error',
      );
    }  else {
      return Failure(
        'unknown Error',
        errorCode: GraphQLError.UNKNOWN,
      );
    }
  }
}
