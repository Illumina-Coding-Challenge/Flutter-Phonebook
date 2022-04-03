import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phonebook_flutter/services/globals.dart' as globals;

class Api {

  /// Método que executa chamada de conexão do tipo GET
  /// @params uri
  /// @params headers (opcional)
  static Future<dynamic> get(
    String uri, {
    Map<String, String>? headers,
  }) async {
    try {
      http.Response response =
          await http.get(Uri.parse(globals.host + uri), headers: headers);
      final statusCode = response.statusCode;
      final String jsonBody = response.body;

      if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
        throw FetchDataException("Error request:", statusCode);
      }

      const JsonDecoder decoder = JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (e) {
      throw FetchDataException(e.toString(), 0);
    }
  }

  /// Método que executa chamada de conexão do tipo POST
  /// @params uri
  /// @params body
  /// @params headers (opcional)
  Future<dynamic> post(
    String uri,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    try {
      http.Response response = await http.post(Uri.parse(globals.host + uri),
          body: body, headers: headers);

      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 300) {
        throw FetchDataException("Error request:", statusCode);
      }

      const JsonDecoder decoder = JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (e) {
      throw FetchDataException(e.toString(), 0);
    }
  }

  /// Método que executa chamada de conexão do tipo PUT
  /// @params uri
  /// @params body
  /// @params headers (opcional)
  Future<dynamic> put(
    String uri,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    try {
      http.Response response = await http.put(Uri.parse(globals.host + uri),
          body: body, headers: headers);

      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 300) {
        throw FetchDataException("Error request:", statusCode);
      }

      const JsonDecoder decoder = JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (e) {
      throw FetchDataException(e.toString(), 0);
    }
  }

  /// Método que executa chamada de conexão do tipo DELETE
  /// @params uri
  /// @params headers (opcional)
  Future<dynamic> delete(String uri, {Map<String, String>? headers}) async {
    try {
      http.Response response =
          await http.delete(Uri.parse(globals.host + uri), headers: headers);

      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 300) {
        throw FetchDataException("Error request:", statusCode);
      }

      const JsonDecoder decoder = JsonDecoder();
      return decoder.convert(response.body);
    } on Exception catch (e) {
      throw FetchDataException(e.toString(), 0);
    }
  }
}

class FetchDataException implements Exception {
  String _message;
  int _code;

  FetchDataException(this._message, this._code);

  String toString() {
    return "Exception: $_message/$_code";
  }

  int code() {
    return _code;
  }
}
