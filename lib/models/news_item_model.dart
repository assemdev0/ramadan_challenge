class NewsItemModel {
  final int id;
  final String image;
  final String profileImage;
  final String type;
  final String title;
  final String name;
  final String date;
  final String source;
  final String sourceImage;
  final String body;
  late bool favorite;

  NewsItemModel({
    required this.id,
    required this.source,
    required this.sourceImage,
    required this.image,
    required this.type,
    required this.title,
    required this.name,
    required this.date,
    required this.profileImage,
    required this.body,
    required this.favorite,
  });

  
}
