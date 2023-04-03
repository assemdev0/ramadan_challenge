class NewsItemModel {
  final String image;
  final String profileImage;
  final String type;
  final String title;
  final String name;
  final String date;
  final String source;
  final String body;

  NewsItemModel({
    required this.source,
    required this.image,
    required this.type,
    required this.title,
    required this.name,
    required this.date,
    required this.profileImage,
    required this.body,
  });
}
