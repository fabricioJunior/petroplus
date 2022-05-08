import 'package:equatable/equatable.dart';

abstract class RemoteException extends Equatable {}

class HttpClientException extends RemoteException {
  final int? statusCode;
  final String? message;
  final dynamic error;

  HttpClientException({this.statusCode, this.message, this.error});

  @override
  List<Object?> get props => [statusCode, message, error];
}

class GenericException extends RemoteException {
  final String? exception;
  GenericException(this.exception);

  @override
  List<Object?> get props => [exception];
}