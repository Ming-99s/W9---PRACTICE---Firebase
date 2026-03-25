import 'package:flutter/widgets.dart';
import 'package:flutterwithronna/FireBaseWeek/data/repositories/artists/artist_repository.dart';
import 'package:flutterwithronna/FireBaseWeek/ui/screens/artist/view_model/artist_view_model.dart';
import 'package:flutterwithronna/FireBaseWeek/ui/screens/artist/widget/artist_content.dart';
import 'package:provider/provider.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ArtistViewModel(artistRepository: context.read<ArtistRepository>()),
      child: ArtistContent(),
    );
  }
}
