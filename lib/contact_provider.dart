import 'package:flutter/material.dart';
import 'contact.dart';

class ContactProvider extends ChangeNotifier {
  final List<Contact> _contacts = [];
  int _selectedIndex = -1;

  List<Contact> get contacts => _contacts;
  int get selectedIndex => _selectedIndex;

  void addContact(String name, String contact) {
    _contacts.add(Contact(name: name, contact: contact));
    notifyListeners();
  }

  void updateContact(String name, String contact) {
    if (_selectedIndex != -1) {
      _contacts[_selectedIndex].name = name;
      _contacts[_selectedIndex].contact = contact;
      _selectedIndex = -1;
      notifyListeners();
    }
  }

  void deleteContact(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }

  void selectContact(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void clearSelection() {
    _selectedIndex = -1;
    notifyListeners();
  }
}