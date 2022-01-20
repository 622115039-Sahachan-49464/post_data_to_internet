import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:post_data_to_internet/Model/Album.dart';

class AlbumApi {

  Future<Album> addAlbum(String title) async {
    final res = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "title": title,
      }),
    );

    if(res.statusCode == 201) {
      return Album.fromJson(jsonDecode(res.body));
    }else{
      throw Exception("fail to post");
    }
  }
}