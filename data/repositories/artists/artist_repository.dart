import 'package:flutterwithronna/FireBaseWeek/model/artist/artist.dart';

abstract class ArtistRepository {
  Future<List<Artist>> fetchArtist();
}
