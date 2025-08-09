// ignore: file_names
import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return ServerFailure(
          errorMessage: "Request to API server was cancelled",
        );
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: "Connection timeout with API server",
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMessage: "Receive timeout in connection with API server",
        );
      case DioExceptionType.badResponse:
        return ServerFailure(
          errorMessage:
              "Received invalid status code: ${dioException.response?.statusCode}",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMessage: "Send timeout in connection with API server",
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage: "Connection error occurred",
        );
      default:
        return ServerFailure(errorMessage: "Unexpected error occurred");
    }
  }
}
