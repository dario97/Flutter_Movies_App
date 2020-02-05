import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalStorage {
  Future<String> get _getLocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/favorites.txt');
  }

  Future<bool> writeFavorite(String favoriteID) async {
    List<String> favorites = await this.readFavorite();
    if (favorites.contains(favoriteID)) {
      return false;
    } else {
      final file = await _getLocalFile;
      // Write the file.
      file.writeAsString("$favoriteID\n", mode: FileMode.append);
      return true;
    }
  }

  Future<List<String>> readFavorite() async {
    List<String> contents = List<String>();
    try {
      final file = await _getLocalFile;
      // Read the file
      contents = await file.readAsLines();
      return contents;
    } catch (e) {
      // If there is an error reading, return a default List
      return contents;
    }
  }
}
