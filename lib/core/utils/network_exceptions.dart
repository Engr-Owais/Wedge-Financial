// lib/core/utils/network_exceptions.dart

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;
  const factory NetworkExceptions.unauthorizedRequest() = UnauthorizedRequest;
  const factory NetworkExceptions.badRequest() = BadRequest;
  const factory NetworkExceptions.notFound(String reason) = NotFound;
  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;
  const factory NetworkExceptions.notAcceptable() = NotAcceptable;
  const factory NetworkExceptions.requestTimeout() = RequestTimeout;
  const factory NetworkExceptions.sendTimeout() = SendTimeout;
  const factory NetworkExceptions.conflict() = Conflict;
  const factory NetworkExceptions.internalServerError() = InternalServerError;
  const factory NetworkExceptions.notImplemented() = NotImplemented;
  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;
  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;
  const factory NetworkExceptions.formatException() = FormatException;
  const factory NetworkExceptions.unableToProcess() = UnableToProcess;
  const factory NetworkExceptions.defaultError(String error) = DefaultError;
  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return const NetworkExceptions.requestCancelled();
      case DioExceptionType.connectionTimeout:
        return const NetworkExceptions.requestTimeout();
      case DioExceptionType.receiveTimeout:
        return const NetworkExceptions.sendTimeout();
      case DioExceptionType.sendTimeout:
        return const NetworkExceptions.sendTimeout();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            return const NetworkExceptions.badRequest();
          case 401:
            return const NetworkExceptions.unauthorizedRequest();
          case 404:
            return const NetworkExceptions.notFound("Not found");
          case 409:
            return const NetworkExceptions.conflict();
          case 500:
            return const NetworkExceptions.internalServerError();
          case 503:
            return const NetworkExceptions.serviceUnavailable();
          default:
            return NetworkExceptions.defaultError(
              "Received invalid status code: ${error.response?.statusCode}",
            );
        }
      case DioExceptionType.connectionError:
        return const NetworkExceptions.noInternetConnection();
      case DioExceptionType.unknown:
      default:
        return const NetworkExceptions.unexpectedError();
    }
  }
}
