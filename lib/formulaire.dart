import 'package:exo/contact_list.dart';
import 'package:flutter/material.dart';

class Formulaire extends StatelessWidget {
  String email = "";
  String password = "";
  String confPassword = "";

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes premiers pas en flutter"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Email", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Entrez un email";
                    }
                    return null;
                  },
                  onChanged: (value) => email = value,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Mot de passe", border: OutlineInputBorder()),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Vous devez fournir un mot de passe avec au moins 6 caractères";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => password = value,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Confirmer le  mot de passe",
                      border: OutlineInputBorder()),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Vous devez fournir un mot de passe avec au moins 6 caractères";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => password = value,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                OutlinedButton(
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/contactlist');
                      }
                    },
                    child: Text("Valide-moi pour voir les listes"),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 1.0, color: Colors.green),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 15.0),
                      textStyle:
                          const TextStyle(color: Colors.green, fontSize: 16.0),
                    )),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    if (_keyForm.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, '/contactlist');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    side: const BorderSide(width: 2.0, color: Colors.blue),
                    elevation: 3,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    textStyle: const TextStyle(fontSize: 16.0),
                  ),
                  child: const Text("Besoin de voir les listes ? "),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
