// lib/core/utils/api_result.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'network_exceptions.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(NetworkExceptions networkExceptions) =
      Failure<T>;
}
