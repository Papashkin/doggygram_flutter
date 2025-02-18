import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() : _title = "Home", _description = "This is the home page";

  final String _title;
  final String _description;

  String get title => _title;
  String get description => _description;

}
