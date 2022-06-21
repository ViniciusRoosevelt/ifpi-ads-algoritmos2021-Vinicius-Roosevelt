import '../../helpers/app_functions.dart';
import '../../models/access_data.dart';

class LocalData {
  static final String _filename = 'access_data';

  static Future<AccessData> readAccessData() async {
    final accessDataJson = await AppFunctions.readFromFile(_filename);
    return AccessData.fromJson(accessDataJson);
  }

  static Future<void> saveAccessData(AccessData accessData) async {
    return AppFunctions.saveInFile(_filename, accessData.toJson());
  }

  static Future<void> deleteAccessData() async {
    AppFunctions.deleteFile(_filename);
  }
}
