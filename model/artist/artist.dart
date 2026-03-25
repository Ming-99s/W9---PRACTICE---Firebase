class Artist {
  final String id;
  final String name;
  final String genre;
  final String imgUrl;

  Artist({required this.genre, required this.imgUrl, required this.name,required this.id});

  @override
  String toString() {
    return 'id: $id,artist: $name ,genre : $genre';
  }
}
