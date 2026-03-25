import 'package:flutter/widgets.dart';
import 'package:flutterwithronna/FireBaseWeek/data/repositories/artists/artist_repository.dart';
import 'package:flutterwithronna/FireBaseWeek/model/artist/artist.dart';
import 'package:flutterwithronna/FireBaseWeek/ui/utils/async_value.dart';

class ArtistViewModel extends ChangeNotifier {
  final ArtistRepository artistRepository;
  ArtistViewModel({required this.artistRepository}){
    init();
  }

  void init(){
    fetchArtist();
  }

  AsyncValue<List<Artist>> artistValue = AsyncValue.loading();

  void fetchArtist() async {
    artistValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Artist> artists = await artistRepository.fetchArtist();
      artistValue = AsyncValue.success(artists);
    } catch (e) {
      artistValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
