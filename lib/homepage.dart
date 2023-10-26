import 'package:flutter/material.dart';
import 'package:state/models.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder(
        valueListenable: ContactBook(),
        builder: (contact, value, child) { 
          final contacts = value as List<Contact>;
          return ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index){
            final contact = contacts[index];
            return Dismissible(
              onDismissed: (direction){
                ContactBook().remove(contact: contact);
              },
              key: ValueKey(contact.id),
              child: Material(
                color: Colors.white,
                elevation: 5,
                child: ListTile(
                  title: Text(contact.name),
                ),
              ),
            );
          });}
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
         await Navigator.of(context).pushNamed('new-contact');
        },
        tooltip: 'Add contact',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
