class Webtoon {
  final String id;
  final String title;
  final String thumb;

  Webtoon.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Webtoon &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          thumb == other.thumb;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ thumb.hashCode;

  @override
  String toString() {
    return 'WebtoonModel{id: $id, title: $title, thumb: $thumb}';
  }
}
