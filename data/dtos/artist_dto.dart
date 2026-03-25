import 'package:flutterwithronna/FireBaseWeek/model/artist/artist.dart';

class ArtistDto {
  static const String genre = 'genre';
  static const String name = 'name';
  static const String imageUrl = 'imageUrl';

  static Artist fromJson(String key, Map<String, dynamic> json) {
    assert(key is String);
    assert(json[genre] is String);
    assert(json[name] is String);
    assert(json[imageUrl] is String);

    return Artist(
      id: key,
      genre: json[genre],
      imgUrl: json[imageUrl],
      name: json[name],
    );
  }

  // Map<String, dynamic> toJson(Artist artist) {
  //   return {name: artist.name, genre: artist.genre, imageUrl: artist.imgUrl};
  // }
}
