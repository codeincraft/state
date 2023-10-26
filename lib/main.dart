import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/deepProvida/homePage.dart';
import 'package:state/deepProvida/models.dart';
import 'package:state/homepage.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';

void main() {
  runApp(

    ChangeNotifierProvider(
      create: (context) => ObjectProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
          
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
          routes: {
            // '/new' :(context) => const NewBreadCrumbWidget(),
            }
       ),
    ),
 
    );
  }
  


