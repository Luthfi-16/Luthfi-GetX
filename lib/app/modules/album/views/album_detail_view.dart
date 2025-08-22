import 'package:belajar_getx/app/data/models/album_model.dart';
import 'package:flutter/material.dart';

class AlbumDetailView extends StatelessWidget {
  final Album album;

  const AlbumDetailView({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album #${album.id}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              album.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "User ID: ${album.userId}",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
