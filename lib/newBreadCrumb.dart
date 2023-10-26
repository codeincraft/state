import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/breadCrumpModel.dart';



class NewBreadCrumbWidget extends StatefulWidget {
  const NewBreadCrumbWidget({super.key});

  @override
  State<NewBreadCrumbWidget> createState() => _NewBreadCrumbWidgetState();
}

class _NewBreadCrumbWidgetState extends State<NewBreadCrumbWidget> {
  late final  TextEditingController _controller;

    @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Data'),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter New Data...',
                  hintStyle: TextStyle(
                    fontSize: 10
                  ),
                ),
              ),
              ), 
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  final text = _controller.text;
                  if(text.isNotEmpty){
                    final breadCrumb = BreadCrumb(isActive: false, name: text);
                    context.read<BreadCrumbProvider>().add(breadCrumb,);

                    Navigator.of(context).pop();
                  }
                }, 
                child: Text('Save')),),
              
          )
        ],
      ),
    );
  }
}