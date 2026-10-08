import 'package:flutter/material.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../models/article_model.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Article> articles = [
    Article(
      title: "Russia and Energy Sales Embargo Update",
      description: "In an interview with the BBC, President Zelenskyy singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales...",
      imageUrl: "https://images.unsplash.com/photo-1541872703-74c5e44368f9?w=500",
      category: "World News",
    ),
    Article(
      title: "Technology Trends in 2026",
      description: "Exploring the latest advancements in artificial intelligence, software engineering, and clean energy tech...",
      imageUrl: "https://images.unsplash.com/photo-1518770660439-4636190af475?w=500",
      category: "Technology",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF007AFF),
        title: const Text('News App', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            color: const Color(0xFF1E1E1E),
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(article.imageUrl, width: 80, fit: BoxFit.cover),
              title: Text(article.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text(article.category, style: const TextStyle(color: Colors.blueAccent)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(article: article),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}