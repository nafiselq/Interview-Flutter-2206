import 'package:flutter/material.dart';
import 'package:flutter_01_test/data/model/article_model.dart';
import 'package:flutter_01_test/shared/theme.dart';

class CustomArticles extends StatelessWidget {
  const CustomArticles({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 100,
      margin: EdgeInsets.only(
          right: defaultMargin, top: defaultMargin, bottom: defaultMargin),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: kTextInput.withOpacity(0.8),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Necessatibus",
            style: inputTextStyle,
          ),
          Expanded(
            child: Text(
              articleModel.title!,
              style: blackTextStyle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
