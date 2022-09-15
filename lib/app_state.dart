import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _Username = prefs.getString('ff_Username') ?? _Username;
    _Password = prefs.getString('ff_Password') ?? _Password;
    _AutoLogin = prefs.getBool('ff_AutoLogin') ?? _AutoLogin;
    _SaveCredentials = prefs.getBool('ff_SaveCredentials') ?? _SaveCredentials;
    _ListView = prefs.getBool('ff_ListView') ?? _ListView;
    _GridView = prefs.getBool('ff_GridView') ?? _GridView;
    _Notifications = prefs.getStringList('ff_Notifications')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _Notifications;
    _NotificationRead = prefs.getStringList('ff_NotificationRead')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _NotificationRead;
    _lastLogin = prefs.getInt('ff_lastLogin') ?? _lastLogin;
  }

  late SharedPreferences prefs;

  List<dynamic> Buttons = [];

  String token = '';

  String _Username = '';
  String get Username => _Username;
  set Username(String _value) {
    _Username = _value;
    prefs.setString('ff_Username', _value);
  }

  String _Password = '';
  String get Password => _Password;
  set Password(String _value) {
    _Password = _value;
    prefs.setString('ff_Password', _value);
  }

  bool _AutoLogin = false;
  bool get AutoLogin => _AutoLogin;
  set AutoLogin(bool _value) {
    _AutoLogin = _value;
    prefs.setBool('ff_AutoLogin', _value);
  }

  bool _SaveCredentials = false;
  bool get SaveCredentials => _SaveCredentials;
  set SaveCredentials(bool _value) {
    _SaveCredentials = _value;
    prefs.setBool('ff_SaveCredentials', _value);
  }

  int userid = 0;

  bool _ListView = true;
  bool get ListView => _ListView;
  set ListView(bool _value) {
    _ListView = _value;
    prefs.setBool('ff_ListView', _value);
  }

  bool _GridView = false;
  bool get GridView => _GridView;
  set GridView(bool _value) {
    _GridView = _value;
    prefs.setBool('ff_GridView', _value);
  }

  List<dynamic> _Notifications = [
    jsonDecode(
        '{\"read\":false,\"title\":\"Nuovo furto sventato\",\"description\":\"Questa sera a caserta\",\"url\":\"https://www.borsecurity.it/\",\"img\":\"https://i.ytimg.com/vi/nqgmlCGNuG0/maxresdefault.jpg\"}')
  ];
  List<dynamic> get Notifications => _Notifications;
  set Notifications(List<dynamic> _value) {
    _Notifications = _value;
    prefs.setStringList(
        'ff_Notifications', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToNotifications(dynamic _value) {
    _Notifications.add(_value);
    prefs.setStringList(
        'ff_Notifications', _Notifications.map((x) => jsonEncode(x)).toList());
  }

  void removeFromNotifications(dynamic _value) {
    _Notifications.remove(_value);
    prefs.setStringList(
        'ff_Notifications', _Notifications.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _NotificationRead = [
    jsonDecode(
        '{\"read\":true,\"title\":\"Messaggio di Benevenuto\",\"description\":\"Questa è una prova di descrizione\",\"url\":\"null\",\"img\":\"https://image.winudf.com/v2/image1/Y29tLmFqaW5mby53bG9zX3NjcmVlbl84XzE2Mjk2OTEyMTdfMDE4/screen-8.jpg?fakeurl=1&type=.jpg\"}')
  ];
  List<dynamic> get NotificationRead => _NotificationRead;
  set NotificationRead(List<dynamic> _value) {
    _NotificationRead = _value;
    prefs.setStringList(
        'ff_NotificationRead', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToNotificationRead(dynamic _value) {
    _NotificationRead.add(_value);
    prefs.setStringList('ff_NotificationRead',
        _NotificationRead.map((x) => jsonEncode(x)).toList());
  }

  void removeFromNotificationRead(dynamic _value) {
    _NotificationRead.remove(_value);
    prefs.setStringList('ff_NotificationRead',
        _NotificationRead.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> Cams = [
    jsonDecode(
        '{\"id\":1,\"path\":\"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4\"}')
  ];

  int _lastLogin = 0;
  int get lastLogin => _lastLogin;
  set lastLogin(int _value) {
    _lastLogin = _value;
    prefs.setInt('ff_lastLogin', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
