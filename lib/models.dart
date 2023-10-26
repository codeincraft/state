import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Contact {
  String id;
  final String name;
   Contact({
    required this.name,
  }): id = Uuid().v4();
}

// Creating singleton contactbook
class ContactBook extends ValueNotifier <List<Contact>> {
   ContactBook._sharedInstance() : super([]);
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;


  final List<Contact> _contacts = [
    
  ];
  int get length => value.length;

  // singleton functions. Add
  void add({required Contact contact }){
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
  }

  // singleton function. remove
   void remove({required Contact contact }){
    final contacts = value;
    if(contacts.contains(contact)){
      contacts.remove(contact);
      notifyListeners();
    }
    
  }

  // A function to retrieve contacts with index
  Contact? contact({required int atIndex}) => 
  value.length > atIndex ? value[atIndex] : null;
}