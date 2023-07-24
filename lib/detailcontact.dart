import 'package:flutter/material.dart';

class DetailContact extends StatefulWidget {
  const DetailContact({super.key});

  @override
  State<DetailContact> createState() => _DetailContactState();
}

class _DetailContactState extends State<DetailContact> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.more_vert),
        ],
        title: Text(
          data['nom'],
          style: const TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/${data['imageProfil']}'),
            const SizedBox(
              height: 10.0,
            ),
            Text('Nom : ${data['nom']}',
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ),
    );
  }
}
