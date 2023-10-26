import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class BaseObject{
  final String id;
  final String lastUpdated;
  BaseObject() : id = const Uuid().v4(),
  lastUpdated = DateTime.now().toIso8601String();

  // implementing the equality for the id, to state if it equal to another object
  @override
  bool operator == (covariant BaseObject other) => id == other.id;

// Generating the hashcode
  @override
  int get hashCode => id.hashCode;
}

@immutable
class ExpensiveObject extends BaseObject{

}

@immutable
class CheapObject extends BaseObject{
  
}

class ObjectProvider extends ChangeNotifier{
  late String id;
  late CheapObject _cheapObject;
  late StreamSubscription _cheapObjectStreamSubs;
  late ExpensiveObject _expensiveObject;
    late StreamSubscription _expensiveObjectStreamSubs;

  // var expensiveObject;
  CheapObject get cheapObject => _cheapObject;
  ExpensiveObject get expensiveObject => _expensiveObject;

  
  // var cheapObject;

    // Constructor for object Provider
    ObjectProvider()
    : id = const Uuid().v4(),
    _cheapObject = CheapObject(),
    _expensiveObject = ExpensiveObject(){
      start();
    }


// this funtiion help reset our ID field when ever we call notify listeners
    @override
    void notifyListeners(){
      id = const Uuid().v4();
      super.notifyListeners();
    }

// Start Function
    void start(){
      _cheapObjectStreamSubs = Stream.periodic(const Duration(seconds: 1),).listen((_) {
        _cheapObject = CheapObject();
        notifyListeners();
       });
       _expensiveObjectStreamSubs = Stream.periodic(const Duration(seconds: 10),).listen((_) {
        _expensiveObject = ExpensiveObject();
        notifyListeners();
       });
    }
// Stop function
  void stop(){
    _cheapObjectStreamSubs.cancel();
    _expensiveObjectStreamSubs.cancel();
  }

}
