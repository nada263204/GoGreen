import 'package:flutter/material.dart';
import 'package:graduation_project/features/articles/models/articles.dart';
import 'package:graduation_project/features/articles/models/datum.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'articles_list_item.dart';

class ArticlesListView extends StatelessWidget {
  final String category;
  final bool isWithImage;

  const ArticlesListView({
    super.key,
    required this.category,
    this.isWithImage = false,
  });

  Future<List<Datum>> fetchArticles(String category) async {
    final response = await http.get(
        Uri.parse('https://articles-api-18tq.onrender.com/category/$category'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      try {
        final jsonResponse = json.decode(response.body);
        final articles = Articles.fromJson(jsonResponse);
        return articles.data ?? [];
      } catch (e) {
        print('Error parsing articles: $e');
        throw Exception('Failed to parse articles');
      }
    } else {
      print('Failed to load articles. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Datum>>(
      future: fetchArticles(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No articles found'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ArticlesListItem(
                  article: snapshot.data![index], isWithImage: isWithImage);
            },
          );
        }
      },
    );
  }
}
