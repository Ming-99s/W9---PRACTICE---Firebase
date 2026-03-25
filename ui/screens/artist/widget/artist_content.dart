import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterwithronna/FireBaseWeek/model/artist/artist.dart';
import 'package:flutterwithronna/FireBaseWeek/ui/screens/artist/view_model/artist_view_model.dart';
import 'package:flutterwithronna/FireBaseWeek/ui/theme/theme.dart';
import 'package:flutterwithronna/FireBaseWeek/ui/utils/async_value.dart';
import 'package:flutterwithronna/FireBaseWeek/ui/widgets/artist/artist_tile.dart';
import 'package:provider/provider.dart';

class ArtistContent extends StatelessWidget {
  const ArtistContent({super.key});

  @override
  Widget build(BuildContext context) {
    ArtistViewModel vm = context.watch<ArtistViewModel>();
    AsyncValue<List<Artist>> asyncValue = vm.artistValue;
    Widget content;

    switch (asyncValue.state) {
      case AsyncValueState.loading:
        content = Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        content = Center(
          child: Text(
            'error = ${asyncValue.error!}',
            style: TextStyle(color: Colors.red),
          ),
        );
        break;
      case AsyncValueState.success:
        List<Artist> artist = asyncValue.data!;
        content = ListView.builder(
          itemCount: artist.length,
          itemBuilder: (content, index) {
            return ArtistTile(artist: artist[index]);
          },
        );
        break;

    }
    

      return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text("Artists", style: AppTextStyles.heading),
            Expanded(child: content),
          ],
        ),
      ),
    );
  }
}
