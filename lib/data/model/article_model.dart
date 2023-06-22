class ArticleModel {
  final String? uid;
  final String? title;
  final String? content;
  final String? image;
  final int? views;
  final DateTime? createdAt;

  ArticleModel({
    this.uid,
    this.title,
    this.content,
    this.image,
    this.views,
    this.createdAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        uid: json['uuid'],
        title: json['title'],
        content: json['content'],
        image: json['image'],
        views: json['views'],
        createdAt: DateTime.parse(json['created']['date']),
      );
}
