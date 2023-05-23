class Downloading {
  final int? id;
  final int downloading;
  final String avatar;
  final int? counter;

  const Downloading({this.id, required this.downloading, required this.avatar, this.counter});

  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'downloading': downloading,
      "avatar": avatar,
      'counter': counter,
    };
  }

  // Implement toString to make it easier to see information about
  // each download when using the print statement.
  @override
  String toString() {
    return 'Downloading{id: $id, downloading: $downloading, avatar:$avatar, counter:$counter}';
  }
}
