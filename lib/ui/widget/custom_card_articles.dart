import 'package:flutter/material.dart';
import 'package:flutter_01_test/data/model/article_model.dart';
import 'package:flutter_01_test/shared/theme.dart';
import 'package:intl/intl.dart';

class CustomCardArticles extends StatelessWidget {
  const CustomCardArticles({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kTextInput.withOpacity(0.23),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      article.image!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  article.title!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              article.content!,
              style: blackTextStyle.copyWith(
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              DateFormat.yMMMMEEEEd('id').add_jm().format(
                    DateTime.parse(
                      article.createdAt.toString(),
                    ),
                  ),
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
