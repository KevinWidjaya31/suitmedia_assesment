import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? selectedUserName;

  void setSelectedUser(String name) {
    selectedUserName = name;
    notifyListeners();
  }
}
