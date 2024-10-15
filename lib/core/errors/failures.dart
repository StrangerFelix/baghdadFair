import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class Failures {
  final String errorMessage;
  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch(dioException.type) {
      
      case DioExceptionType.connectionTimeout:
        return ServerFailure(Intl.getCurrentLocale() == 'en' ? 'Connection timeout with ApiServer!' : 'انتهت مهلة الاتصال مع الخادم!');
      case DioExceptionType.sendTimeout:
        return ServerFailure(Intl.getCurrentLocale() == 'en' ? 'Send timeout with ApiServer!' : 'هناك مشكلة اتصال مع الخادم!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(Intl.getCurrentLocale() == 'en' ? 'Receive timeout with ApiServer!' : 'هناك مشكلة اتصال مع الخادم!');
      case DioExceptionType.badCertificate:
        return ServerFailure(Intl.getCurrentLocale() == 'en' ? 'Bad certificate with ApiServer!' : 'هناك مشكلة اتصال مع الخادم!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(Intl.getCurrentLocale() == 'en' ? 'Request to ApiServer was canceled!' : 'تم رفع طلب البيانات من الخادم!');
      case DioExceptionType.connectionError:
        return ServerFailure(Intl.getCurrentLocale() == 'en' ? 'Connection error with ApiServer!' : 'هناك مشكلة اتصال مع الخادم!');
      case DioExceptionType.unknown:
        if(dioException.message!.contains('SocketException')){
          return ServerFailure(Intl.getCurrentLocale() == 'en' ? 'No Internet Connection' : 'لا يوجد اتصال بالانترنت');
        }
        return ServerFailure(Intl.getCurrentLocale() == 'en' ? 'Unexpected Error!' : 'حدث خطأ غير متوقع!');
      default:
        return ServerFailure(Intl.getCurrentLocale() == 'en' ? 'Opps, something went wrong!' : 'للاسف, حدث خطأ ما!');
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