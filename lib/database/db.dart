class DB {
   String _key;
   String _id;
  final _url = "https://flutter-store.herokuapp.com/database";

  static final DB _instance = DB._internal();

  DB._internal([this._id,this._key]);

  factory DB.initialize(String key, String id) {
    _instance._key = key;
    _instance._id = id;
    return _instance;
  }

  factory DB() => _instance;

}