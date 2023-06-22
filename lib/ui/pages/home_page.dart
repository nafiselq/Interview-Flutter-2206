import 'package:flutter/material.dart';
import 'package:flutter_01_test/data/blocs/article/article_bloc.dart';
import 'package:flutter_01_test/data/blocs/auth/auth_bloc.dart';
import 'package:flutter_01_test/shared/shared_shimmer_loading.dart';
import 'package:flutter_01_test/shared/theme.dart';
import 'package:flutter_01_test/ui/widget/custom_articles.dart';
import 'package:flutter_01_test/ui/widget/custom_card_articles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget headerText() {
      return BlocProvider(
        create: (context) => ArticleBloc()..add(ArticleGet()),
        child: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleSuccess) {
              return Container(
                margin: EdgeInsets.only(top: defaultMargin),
                child: Row(
                  children: [
                    Text(
                      "Welcome, ",
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthSuccess) {
                          return Text(
                            state.user.name.toString(),
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              );
            } else {
              return showShimmerHeaderTextHome();
            }
          },
        ),
      );
    }

    Widget articles() {
      return BlocProvider(
        create: (context) => ArticleBloc()..add(ArticleGet()),
        child: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleSuccess) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.articles
                      .map(
                        (articleModel) =>
                            CustomArticles(articleModel: articleModel),
                      )
                      .toList(),
                ),
              );
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    showShimmerArticles(),
                    showShimmerArticles(),
                    showShimmerArticles(),
                    showShimmerArticles(),
                  ],
                ),
              );
            }
          },
        ),
      );
    }

    Widget cardArticles() {
      return BlocProvider(
        create: (context) => ArticleBloc()..add(ArticleGet()),
        child: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleSuccess) {
              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: state.articles
                        .map(
                          (article) => CustomCardArticles(
                            article: article,
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            } else {
              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      showShimmerCardArticles(),
                      showShimmerCardArticles(),
                      showShimmerCardArticles(),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerText(),
              articles(),
              cardArticles(),
            ],
          ),
        ),
      ),
    );
  }
}
