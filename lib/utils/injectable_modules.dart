import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectableModules {
  @lazySingleton
  RxSharedPreferences get rxSharedPreference => RxSharedPreferences(
        SharedPreferences.getInstance(),
        const DefaultLogger(),
      );

  @lazySingleton
  http.Client get httpClient => http.Client();
}
