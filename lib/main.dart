import 'package:exo/contact_list.dart';
import 'package:exo/detailcontact.dart';
import 'package:flutter/material.dart';
import 'formulaire.dart';
void main () =>runApp(MonApplication()); 

class MonApplication extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
     theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/formulaire',
    routes: {
      '/formulaire':(context) => Formulaire(),
      '/contactlist':(context) => ContactList(),
      '/detailcontact':(context) => DetailContact(),
    },
  
   );
  }
}