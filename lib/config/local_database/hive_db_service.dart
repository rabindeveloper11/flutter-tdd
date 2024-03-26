import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static const String savedPopular = 'savedPopular';
  static const String savedTours = 'savedTours';
  static const String savedCategories = 'savedCategories';

  /// initialize hive db
  static Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
 
  }

  Future<void> openBox() async {
    await Hive.openBox(savedPopular);
    await Hive.openBox(savedTours);
    await Hive.openBox(savedCategories);
  }

  Future<void> closeBox() async {
    await Hive.box(savedPopular).close();
    await Hive.box(savedTours).close();
    await Hive.box(savedCategories).close();
  }

  Future<void> clearBox(String boxName) async {
    await Hive.box(boxName).clear();
  }

  Future<void> deleteBox(String boxName) async {
    await Hive.box(boxName).deleteFromDisk();
  }

  /// add data to box

  Future<void> addData(String boxName, Map<String, dynamic> data) async {
    await Hive.box(boxName).add(data);
  }

  /// get data from box

  Future<List<Map<String, dynamic>>> getData(String boxName) async {
    final box = Hive.box(boxName);
    final List<Map<String, dynamic>> data = [];
    for (int i = 0; i < box.length; i++) {
      Map<String, dynamic> boxData = Map<String, dynamic>.from(box.get(i));
      data.add(boxData);
    }
    return data;
  }

  /// delete data from the box

  Future<void> deleteData(String boxName, int index) async {
    await Hive.box(boxName).deleteAt(index);
  }
}
