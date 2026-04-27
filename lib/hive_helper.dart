import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static const String historyBox = 'history';

  // Open the Hive box
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<Map<String, dynamic>>(historyBox);
  }

  // Get the box
  static Box<Map<String, dynamic>> getBox() {
    return Hive.box<Map<String, dynamic>>(historyBox);
  }

  // Add a history entry
  static Future<void> addEntry(Map<String, dynamic> entry) async {
    var box = getBox();
    // Ensure that entry is of the correct type before adding
    if (entry is Map<String, dynamic>) {
      await box.add(entry);
    } else {
      throw Exception("Invalid entry type. Expected Map<String, dynamic>.");
    }
  }

  // Clear all history
  static Future<void> clearAllHistory() async {
    var box = getBox();
    await box.clear();
  }

  // Delete a specific entry by index
  static Future<void> deleteEntry(int index) async {
    var box = getBox();
    await box.deleteAt(index);
  }

  // Fetch all history entries
  static List<Map<String, dynamic>> fetchAllHistory() {
    var box = getBox();
    return box.values.toList();
  }
}
