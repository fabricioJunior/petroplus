import 'package:dio/dio.dart';

import 'excepions.dart';

const unexpectedError = 'Ocorreu um erro inesperado';
const timeoutError = 'Tempo de solicitação inesperado';
const plataformException = 'Erro inesperado. Verifique a conexão com internet!';

/// [Client_Exception_Generator]
RemoteException getHttpClientException(DioError err) {
  if (err.type == DioErrorType.other) {
    return HttpClientException(
      message: unexpectedError,
      statusCode: 0,
      error: err.error,
    );
  }

  if (err.type == DioErrorType.sendTimeout ||
    err.type == DioErrorType.receiveTimeout ||
    err.type == DioErrorType.connectTimeout) {
      return HttpClientException(
        message: timeoutError,
        statusCode: 1,
        error: err,
      );
    }

  else {
    return HttpClientException(
      message: err.response?.statusMessage,
      statusCode: err.response?.statusCode,
      error: err.error,
    );
  }
}