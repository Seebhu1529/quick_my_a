import 'package:hive/hive.dart';

class MyLocalData {
  final userDataBox = Hive.box("userData");
  void saveUserData({required email, required password, bool? isLogin}) {
    userDataBox.putAll({
      "auth": {"email": email, "password": password},
      "isLogin": true
    });
  }

  void saveFavouriteData({required Map itemData}) {
    userDataBox.putAll({
      "favourite": [itemData]
    });
  }

  Map getFavouriteData() {
    return userDataBox.get("favourite");
  }
}
