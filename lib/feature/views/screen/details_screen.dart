import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:share_plus/share_plus.dart';

class DetailsScreen extends StatelessWidget {
  final ArticleModel article;

  const DetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
        centerTitle: true,
        actions: [
          if (article.url != null)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                Share.share('Check out this news: ${article.url}');
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null)
              Image.network(
                article.urlToImage!,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  height: 250,
                  child: Center(child: Icon(Icons.broken_image, size: 60)),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? 'No Title',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    const SizedBox(height: 12),
                  if (article.publishedAt != null)
                    Text(
                      'Published at: ${article.publishedAt!.substring(0, 10)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  const Divider(height: 24),
                  Text(
                    article.content ?? article.description ?? 'No Content Available',
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}