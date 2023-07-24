import 'package:exo/contact_model.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> contacts = [
    Contact('Sali', 'img2.jpeg'),
    Contact('Christian', 'img2.jpeg'),
    Contact('YoneUSS', 'img2.jpeg'),
    Contact('GuyAnge', 'img2.jpeg'),
    Contact('Emma', 'img2.jpeg'),
    Contact('AngeChrist', 'img3.png'),
    Contact('AdouYUN', ''),
    Contact('Charles', ''),
    Contact('Debora', 'img3.png'),
    Contact('Laudja', 'img2.jpeg'),
  ];

  final Color _colors = Colors.black;

  Widget _dialogBuilder(BuildContext context, Contact contact) {
    ThemeData localTheme = Theme.of(context);

    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.asset("assets/${contact.imageProfil}"),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                contact.nom,
                style: localTheme.textTheme.displayMedium,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  children: [
                    TextButton(
                      onPressed: () => {
                        Navigator.pushReplacementNamed(
                            context, '/detailcontact', arguments: {
                          'imageProfil': contact.imageProfil,
                          'nom': contact.nom
                        })
                      },
                      child: const Text('Détail'),
                    ),
                    ElevatedButton(
                        onPressed: () => {Navigator.of(context).pop()},
                        child: const Text("Annuler")),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des  Contacts"),
        centerTitle: true,
        actions: const <Widget>[Icon(Icons.search), Icon(Icons.more_vert)],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10.0),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          var nameInitial = contacts[index].nom[0];

          if (contacts[index].imageProfil.isNotEmpty) {
            nameInitial = '';
          }
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
            child: Card(
              child: ListTile(
                onTap: () => showDialog(
                    context: context,
                    builder: (context) =>
                        _dialogBuilder(context, contacts[index])),
                title: Text(
                  contacts[index].nom,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                leading: CircleAvatar(
                  backgroundColor: _colors,
                  backgroundImage:
                      AssetImage('assets/${contacts[index].imageProfil}'),
                  child: Text(
                    nameInitial,
                    style: const TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
