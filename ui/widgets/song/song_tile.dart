import 'package:flutter/material.dart';
import 'package:flutterwithronna/FireBaseWeek/model/artist/artist.dart';
import 'package:flutterwithronna/FireBaseWeek/ui/utils/time_format.dart';

import '../../../model/songs/song.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
    required this.artist,
  });

  final Song song;
  final Artist artist;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(song.imageUrl),
          ),
          subtitle: Text('${TimeFormat.formatDuration(song.duration)} min ${artist.name} - ${artist.genre}'),
          onTap: onTap,
          title: Text(song.title),
          trailing: Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
