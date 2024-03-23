import 'dart:io';

String readJson(String path) {
  var dir = Directory.current.path;
  if (dir.contains('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  final file = File('$dir/test/$path');
  return file.readAsStringSync();
}
