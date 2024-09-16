import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
class LocalGetStorage {
 static void getStorage() async {
    await GetStorage.init();
  }
}

class StorageController extends GetxController{
  final loginBox = GetStorage();
  bool get isLoggedIn => loginBox.hasData('email');

  void login(String email) => loginBox.write('email', email);
}