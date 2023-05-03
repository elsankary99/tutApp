import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetWorkInfo {
  Future<bool> isConnected();
}

class NetWorkInfoImpl implements NetWorkInfo {
  final InternetConnectionChecker _internetConnectionChecker;
  NetWorkInfoImpl(this._internetConnectionChecker);
  @override
  Future<bool> isConnected() => _internetConnectionChecker.hasConnection;
}
