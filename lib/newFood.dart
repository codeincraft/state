import 'package:flutter/material.dart';
import 'package:state/models.dart';

class AddNewFood extends StatefulWidget {
  const AddNewFood({super.key});

  @override
  State<AddNewFood> createState() => _AddNewFoodState();
}

class _AddNewFoodState extends State<AddNewFood> {
  late final TextEditingController _controller;

  @override
  void initState() {
   
    _controller = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {  
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Food'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter New Contact Name...'
              ),
            ),
          ),
          TextButton(
            onPressed: (){
              final contact = Contact(name: _controller.text);
              ContactBook().add(contact: contact);
              Navigator.of(context).pop();
            }, 
            child: const Text('Add New'),)
        ],
      ),
    );
  }
}