import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:post_data_to_internet/Model/Album.dart';
import 'package:post_data_to_internet/service/AlbumApi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  late final AlbumApi albumApi = AlbumApi();

  Future<Album>? _futureAlbum;

  Widget buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: "Enter Title"),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = albumApi.addAlbum(_controller.text);
            });
          },
          child: const Text("create Data"),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
    );
  }
}
