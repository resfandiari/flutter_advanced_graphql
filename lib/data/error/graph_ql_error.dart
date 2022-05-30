class GraphQLError implements Exception {
  // InApp error codes. Some errors descriptions are the same, this codes are
  // used for classification
  static const String UNKNOWN = 'X00';
  static const String NO_DATA_CODE = 'X01';

  final bool noData;
  final bool hasMessage;
  final String? message;

  GraphQLError({
    bool? noData,
  })  : noData = noData ?? false,
        hasMessage = false,
        message = null;

  GraphQLError.message({
    this.message,
  })  : noData = false,
        hasMessage = message?.isNotEmpty ?? false;

  @override
  String toString() => '''$runtimeType(
          noData: $noData, 
          hasMessage: $hasMessage, 
          message: $message, 
      )'''
      .replaceAll('\n', '');
}
