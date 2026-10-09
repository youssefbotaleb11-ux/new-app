class ArticleModel {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? url;
  final String? publishedAt;
  final String? content;

  ArticleModel({
    this.title,
    this.description,
    this.urlToImage,
    this.url,
    this.publishedAt,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      url: json['url'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}