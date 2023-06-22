import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_01_test/data/services/article_services.dart';

import '../../model/article_model.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) async {
      if (event is ArticleGet) {
        try {
          emit(ArticleLoading());

          final articles = await ArticleServices().listArticles();

          emit(ArticleSuccess(articles));
        } catch (e) {
          emit(ArticleFailed(e.toString()));
        }
      }
    });
  }
}
