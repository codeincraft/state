import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/breadCrumb.dart';
import 'package:state/breadCrumpModel.dart';


class Provida extends StatelessWidget {
  const Provida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Consumer<BreadCrumbProvider>(builder: (context, value, child) {
              return BreadCrumbWidget(
                breadCrumbs: value.items);
            }),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed( '/new');
                },
               child: Text('Add New Data'),
               ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  context.read<BreadCrumbProvider>().reset();
                }, 
                child: Text('Reset')
                ),
            ),
          ],
        ),
      ),
    );
  }
}