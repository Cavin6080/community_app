import 'dart:io';

import 'package:community_managment/app/rest_client/network_exception.dart';
import 'package:dio/dio.dart';

/// Interceptor for the app
class AppInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final session = await SessionModule().getSessionRepo().getSession().single;
    // if (session != null)
    //   options.headers.addAll({
    //     'token': session.token,
    //   });
    return options;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final exception = _getErrorObject(response);
    if (exception != null) throw exception;
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError error, ErrorInterceptorHandler handler) async {
    // Check if error is of time out error
    if (error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      return ServerConnectionException(
          'Couldn\'t connect with server. Please try again.');
    }

    // Check if the error is regarding no internet connection.
    if (error.type == DioErrorType.connectTimeout &&
        error.error is SocketException) {
      return NoInternetException();
    }

    // Check if server responded with non-success status code.
    // In this case, we will check if we got a specific error
    // from API to display to the user.
    if (error.type == DioErrorType.response) {
      NetworkException? networkException = _getErrorObject(error.response!);
      networkException ??=
          NetworkException('Something went wrong, please try again!');
      return networkException;
    }
    return error;
  }

  /// Parses the font_grapql_response to get the error object if any
  /// from the API font_grapql_response based on status code.
  NetworkException? _getErrorObject(Response response) {
    final responseData = response.data;
    if (responseData is Map) {
      final data = responseData['data'];
      if (data != null && data is Map && data.containsKey('errors')) {
        final errors = data['errors'];
        if (errors is String) {
          return NetworkException(
            errors,
          );
        } else if (errors is Map && errors.length > 0) {
          final errorsValue = errors.values.toList()[0];
          if (errorsValue is String && errorsValue.isNotEmpty == true) {
            return NetworkException(
              errorsValue,
            );
          }
          if (errorsValue is List && errorsValue.isNotEmpty) {
            return NetworkException(
              errorsValue[0],
            );
          }
        }
        return NetworkException(
          'Something went wrong, please try again!',
        );
      } else {
        final error = responseData['error'];
        if (error is String && (error.contains('Token expired') == true) ||
            error?.contains('Invalid token') == true) {
          // SessionExpirationHelper().sessionExpirationStream.add(true);
          return NetworkException(
            error,
          );
        } else {
          final errors = responseData['errors'];
          if (errors is String) {
            return NetworkException(
              errors,
            );
          } else if (errors is Map && errors.length > 0) {
            final errorsValue = errors.values.toList()[0];
            if (errorsValue is List && errorsValue.isNotEmpty) {
              return NetworkException(
                errorsValue[0],
              );
            }
          }
        }
      }
    }
    return null;
  }
}
