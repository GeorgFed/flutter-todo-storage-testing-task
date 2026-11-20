import 'package:shared_preferences/shared_preferences.dart';

import 'storage.dart';

class PreferencesStore implements TextStore {
  PreferencesStore(this.prefs, {this.key = 'practice.todos'});

  final SharedPreferencesAsync prefs;
  final String key;

  // TODO 3: подключите чтение и запись строки по key.
  @override
  Future<String?> read() async => throw UnimplementedError();

  @override
  Future<void> write(String value) async => throw UnimplementedError();
}
