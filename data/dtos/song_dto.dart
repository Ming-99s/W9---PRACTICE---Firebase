import '../../model/songs/song.dart';

class SongDto {
  static const String titleKey = 'title';
  static const String artistKey = 'artistId';
  static const String durationKey = 'duration'; // in ms'
  static const String imgUrl = 'imageUrl';

  static Song fromJson(String id, Map<String, dynamic> json) {
    assert(id is String);
    assert(json[titleKey] is String);
    assert(json[artistKey] is String);
    assert(json[durationKey] is int);
    assert(json[imgUrl] is String);

    return Song(
      id: id,
      title: json[titleKey],
      artist: json[artistKey],
      duration: Duration(milliseconds: json[durationKey]),
      imageUrl: json[imgUrl],
    );
  }

  /// Convert Song to JSON
  Map<String, dynamic> toJson(Song song) {
    return {
      titleKey: song.title,
      artistKey: song.artist,
      durationKey: song.duration.inMilliseconds,
      imgUrl: song.imageUrl,
    };
  }
}
