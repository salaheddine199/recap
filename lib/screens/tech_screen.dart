import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/news_cubit.dart';
import 'problem_screen.dart';
import 'widgets/article_item.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, NewsState state) {},
      builder: (BuildContext context, NewsState state) {
        List resultNews = NewsCubit.get(context).technology;

        if (state is NewsGetSportsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsGetSportsFailed) {
          return const SomethingWrong();
        } else if (resultNews.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                ArticleItem(myArticle: resultNews[index]),
            itemCount: resultNews.length,
            separatorBuilder: (context, index) => const MyDivider(),
          );
        }
      },
    );
  }
}
