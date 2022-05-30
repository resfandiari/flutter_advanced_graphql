import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';

@freezed
class Company with _$Company {
  const factory Company({
    String? id,
    String? name,
    String? industry,
  }) = _Company;
}
