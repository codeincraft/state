import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/deepProvida/homePage.dart';
import 'package:state/deepProvida/models.dart';
import 'package:state/homepage.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final expensiveObject = context.select<ObjectProvider, ExpensiveObject>(
      (provider) => provider.expensiveObject,
    );
    return Container(
       padding: EdgeInsets.all(10),
      height: 100,
      color: Colors.orange,
      child: Column(
        children: [
          const Text(
            'Expensive Object',
          ),
          const Text('Last Updated'),
          Text(expensiveObject.lastUpdated),
        ],
      ),
    );
  }
}

class CheapWidget extends StatelessWidget {
  const CheapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cheapObject = context.select<ObjectProvider, CheapObject>(
      (provider) => provider.cheapObject,
    );
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      color: Colors.grey.withOpacity(0.5),
      child: Column(
        children: [
          const Text(
            'Expensive Object',
          ),
          const Text('Last Updated'),
          Text(cheapObject.lastUpdated),
        ],
      ),
    );
  }
}


class ObjectProviderWidget extends StatelessWidget {
  const ObjectProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ObjectProvider>();
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      color: Colors.grey,
      child: Column(
        children: [
          const Text(
            'Expensive Object',
          ),
          const Text('ID'),
          Text(provider.id),
        ],
      ),
    );
  }
}

