import 'package:dio/dio.dart';

/// Represents exception related to network
class NetworkException implements DioError {
  final _message;
  final int code;

  NetworkException(
      this._message, {
        this.code = -1,
      });

  String toString() {
    return _message;
  }

  @override
  var error;

  @override
  RequestOptions? request;

  @override
  Response? response;

  @override
  DioErrorType type = DioErrorType.other;

  @override
  String get message => _message;

  @override
  late RequestOptions requestOptions;

  @override
  StackTrace? stackTrace;
}

/// Represents there's no internet connection
class NoInternetException extends NetworkException {
  NoInternetException([String? message])
      : super(message ?? 'No internet connection found!');

  @override
  late RequestOptions requestOptions;

  @override
  StackTrace? stackTrace;
}

/// Represents error in communicating with server
class ServerConnectionException extends NetworkException {
  ServerConnectionException([String? message])
      : super(
      message ?? 'Failed to connect with server, please try again later');

  @override
  late RequestOptions requestOptions;

  @override
  StackTrace? stackTrace;
}