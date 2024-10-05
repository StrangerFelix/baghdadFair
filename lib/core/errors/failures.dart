import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;
  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch(dioException.type) {
      
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer!');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer!');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with ApiServer!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled!');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with ApiServer!');
      case DioExceptionType.unknown:
        if(dioException.message!.contains('SocketException')){
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error!');
      default:
        return ServerFailure('Opps, something went wrong :(');
    }

  }
  factory ServerFailure.fromResponse (int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try again later!');
    } else {
      return ServerFailure('Opps, something went wrong :(');
    }
  }
}