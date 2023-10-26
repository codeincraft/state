import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/deepProvida/expensiveWidget.dart';
import 'package:state/deepProvida/models.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Row(
            children: const[
              Expanded(child: CheapWidget()),
              Expanded(child: ExpensiveWidget())
            ],
          ),
          Row(
            children: const[
              Expanded(child: ObjectProviderWidget())
            ],
          ),
          const SizedBox(
            height: 20,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150),
              child: Row(
                children: [
                   TextButton(onPressed: (){
                    context.read<ObjectProvider>().stop();
                   }, 
                   child: const Text('Stop')),
                    TextButton(onPressed: (){
                       context.read<ObjectProvider>().start();
                    }, 
                   child: const Text('Start')),
                ],
              ),
            )
        ],
        
      ),
    );
  }
}