import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recap_awdi/cubit/news_cubit.dart';
import 'package:recap_awdi/screens/problem_screen.dart';
import 'package:recap_awdi/screens/widgets/article_item.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, NewsState state) {},
      builder: (BuildContext context, NewsState state) {
        List resultNews = NewsCubit.get(context).sports;

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
