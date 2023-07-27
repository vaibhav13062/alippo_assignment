


import '../constants/string_constants.dart';

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, StringEN.communicationError);
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, StringEN.invalidRequest);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message,StringEN.unAuthorised);
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, StringEN.invalidInputError);
}

class ForbiddenException extends CustomException {
  ForbiddenException([message]) : super(message, StringEN.forbiddenRequest);
}
