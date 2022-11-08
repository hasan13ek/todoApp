import 'package:first_lesson/service/storage_service.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLight = StorageService.getBool("isLight");

  setIsLight(bool isLight) async {
    _isLight = isLight;
    await StorageService.saveBool("isLight", _isLight);
    notifyListeners();
  }

  getIsLight() {
    return _isLight;
  }
}