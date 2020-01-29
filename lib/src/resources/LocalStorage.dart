import 'dart:io';

import 'package:path_provider/path_provider.dart';
class LocalStorage {
  Future<String> get _getLocalPath async {
  final directory = await getApplicationDocumentsDirectory();
  print(directory);
  return directory.path;
}

Future<File> get _getLocalFile async {
  final path = await _getLocalPath;
  return File('$path/favorites.txt');
}

Future<File> writeFavorite(String favoriteID) async {
  final file = await _getLocalFile;
  // Write the file.
  return file.writeAsString(favoriteID);
}
}