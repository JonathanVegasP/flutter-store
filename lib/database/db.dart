import 'dart:convert';
import 'dart:io';

class DB {
  String _key;
  String _id;
  final _url = "https://flutter-store.herokuapp.com/database";

  static final DB _instance = DB._internal();

  DB._internal([this._id, this._key]);

  factory DB.initialize(String key, String id) {
    _instance._key = key;
    _instance._id = id;
    return _instance;
  }

  factory DB() => _instance;

  Future<Map<String, dynamic>> getDataByJson(
      String table, Map<String, dynamic> map) async {
    try {
      String queryUrl = "";
      for(int i = 0; i< map.keys.length; i++) {
        final key = map.keys.elementAt(i);
        if(i == 0) {
          queryUrl += "$key=${map[key]}";
        } else {
          queryUrl += "&$key=${map[key]}";
        }
      }
      final request = await HttpClient().getUrl(Uri.parse("$_url/$table?$queryUrl"));
      request
        ..headers.add("key", _key)
        ..headers.add("id", _id)
        ..headers.contentType = ContentType.json;
      final response = await request.close();
      if(response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(await response.transform(utf8.decoder).single);
      } else {
        return {
          "status": response.statusCode,
          "headers": response.headers.toString(),
          "body": await response.transform(utf8.decoder).single
        };
      }
    } on SocketException {
      return {
        "msg": "Nao foi possivel conectar com o servidor, tente novamente mais tarde."
      };
    } catch (e) {
      print(e);
      return {
        "error": e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> createTable(
      String table, Map<String, dynamic> map) async {
    try {
      final body = json.encode(map);
      final request = await HttpClient().postUrl(Uri.parse("$_url/$table"));
      request
        ..headers.add("key", _key)
        ..headers.add("id", _id)
        ..headers.contentType = ContentType.json
        ..contentLength = -1
        ..write(body);
      final response = await request.close();
      if(response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(await response.transform(utf8.decoder).single);
      } else {
        return {
          "status": response.statusCode,
          "headers": response.headers.toString(),
          "body": await response.transform(utf8.decoder).single
        };
      }
    } on SocketException {
      return {
        "msg": "Nao foi possivel conectar com o servidor, tente novamente mais tarde."
      };
    } catch (e) {
      print(e);
      return {
        "error": e.toString(),
      };
    }
  }
}
