import 'package:hive_ce_flutter/hive_flutter.dart';

abstract class HiveConst {
  static const String userData = 'userData';
  static const String authToken = 'authToken';
  static const String id = 'id';
}

abstract class LocalStorage {
  Future<void> clearAllBox();

  String? getId();

  Future<void> saveId(String id);
}

class HiveStorageImp extends LocalStorage {
  final Box userBox;

  HiveStorageImp({
    required this.userBox,
  });

  static Future<LocalStorage> init() async => HiveStorageImp(
        userBox: await Hive.openBox(HiveConst.userData),
      );

  @override
  Future<void> clearAllBox() async {
    await userBox.clear();
  }



  @override
  Future<void> saveId(String id) async {
    await userBox.put(HiveConst.id, id);
  }

  @override
  String? getId() {
    final authToken = userBox.get(HiveConst.id);
    return authToken;
  }
}
