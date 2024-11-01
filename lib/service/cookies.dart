import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CookiesCustomController extends GetxController {
  final storage = GetStorage();

  void initializeUsers() {
    if (storage.read('users') == null) {
      storage.write('users', [
        {
          'username': 'user1',
          'password': 'nusantara',
          'fullname': 'Kasir 1',
        },
        {
          'username': 'user2',
          'password': 'indonesia',
          'fullname': 'Kasir 2',
        }
      ]);
    }
  }

  List<dynamic> getUsers() {
    return storage.read<List<dynamic>>('users') ?? [];
  }

  Future<void> saveCacheLogin(
      String username, String password, bool rememberme) async {
    await storage.write(
      'cacheUser',
      {
        "username": username,
        "password": password,
        "rememberme": rememberme,
      },
    );
  }

  Future<void> deleteCacheLogin() async {
    if (storage.read('cacheUser') != null) {
      storage.erase();
    }
  }

  Future<void> saveLoginStatus(int sessionDurationInSeconds) async {
    final expiryTime = DateTime.now()
        .add(Duration(seconds: sessionDurationInSeconds))
        .millisecondsSinceEpoch;
    await storage.write('isLogged', true);
    await storage.write('expiryTime', expiryTime);
  }

  Future<void> clearLoginStatus() async {
    await storage.remove('isLogged');
    await storage.remove('expiryTime');
  }

  Future<bool> checkAutoLogin() async {
    final isLogged = storage.read<bool>('isLogged') ?? false;
    final expiryTime = storage.read<int>('expiryTime') ?? 0;
    if (isLogged) {
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      if (currentTime >= expiryTime) {
        await clearLoginStatus();
        return false;
      }
      return true;
    }
    return false;
  }
}
