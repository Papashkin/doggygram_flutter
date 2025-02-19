import 'package:flutter/material.dart';
import '../../../data/repository/DataRepository.dart';

class HomeViewModel extends ChangeNotifier {
  final DataRepository repository;

  HomeViewModel(this.repository) : _title = "Home", _description = "This is the home page";

  final String _title;
  final String _description;

  String get title => _title;
  String get description => _description;

}
