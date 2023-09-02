import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const PlaceTile(this.snapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: Image.network(
              snapshot["image"],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot["title"],
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  snapshot["address"],
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            TextButton(
              child: const Text(
                'Ver no Mapa',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                launchUrl(
                  Uri.parse(
                      'https://www.google.com/maps/search/?api=1&query=${snapshot["lat"]},'
                      '${snapshot["long"]}'),
                );
              },
            ),
            TextButton(
              child: const Text(
                'Ligar',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                launchUrl(Uri.parse('tel: ${snapshot["phone"]}'));
              },
            ),
          ]),
        ],
      ),
    );
  }
}
