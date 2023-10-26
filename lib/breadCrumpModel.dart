import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class BreadCrumb {
  bool isActive;
  final String name;
  final String uuid;
  BreadCrumb({
    required this.isActive,
    required this.name,
  }): uuid = const Uuid().v4();

  void activate(){
    isActive = true;
  }
  // Implement Equality
  @override
  bool operator == (covariant BreadCrumb other) =>
  uuid == other.uuid;
  
  @override
    // TODO: implement hashCode
  int get hashCode => uuid.hashCode;

// calculating title based on 'isActive'
  String get title => name + (isActive ? '>' : ''); 
  
  
}

class BreadCrumbProvider extends ChangeNotifier{
  final List<BreadCrumb> _items = [];
  UnmodifiableListView <BreadCrumb> get items =>UnmodifiableListView(_items);

  void add(BreadCrumb breadCrumb){
    for(final item in _items){
      item.activate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }
  void reset(){
    _items.clear();
    notifyListeners();
  }
}
