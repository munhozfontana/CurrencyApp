// APIS
class ServerApiException implements Exception {
  final String error;

  ServerApiException({this.error});
}

class ClientServerApiException extends ServerApiException {
  final String error;

  ClientServerApiException({this.error});
}

class InternalServerApiException extends ServerApiException {
  final String error;

  InternalServerApiException({this.error});
}

class ClientServerUseCaseException extends ServerApiException {
  final String error;

  ClientServerUseCaseException({this.error});
}

// DATABASE

class DataBaseException implements Exception {
  final String error;

  DataBaseException({this.error});
}

class ClientDataBaseException extends DataBaseException {
  final String error;

  ClientDataBaseException({this.error});
}
