import 'dart:convert';

import 'package:flutterwithronna/FireBaseWeek/data/dtos/artist_dto.dart';
import 'package:flutterwithronna/FireBaseWeek/data/repositories/artists/artist_repository.dart';
import 'package:flutterwithronna/FireBaseWeek/model/artist/artist.dart';
import 'package:http/http.dart' as http;

class ArtistRepostioryFirebase implements ArtistRepository {
  final Uri artistUri = Uri.https(
    'test-project-1716e-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/artists.json',
  );

  @override
  Future<List<Artist>> fetchArtist() async {
    final http.Response response = await http.get(artistUri);

    if (response.statusCode == 200) {
      Map<String, dynamic> artistMap = json.decode(response.body);

      List<Artist> artists = [];

      artistMap.forEach((key, value) {
        final Artist artist = ArtistDto.fromJson(key, value);
        artists.add(artist);
      });
      return artists;
    } else {
      throw Exception('Error');
    }
  }
}
