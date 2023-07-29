import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recap_awdi/cubit/news_cubit.dart';
import 'package:recap_awdi/screens/widgets/article_item.dart';
import 'package:recap_awdi/shared/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List search = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Search Page"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                defaultFormField(
                  validFun: (String? value) {
                    if (value == null) {
                      return "Please Type Something";
                    } else if (value.trim().isEmpty) {
                      {
                        return "      Please Type Something";
                      }
                    }
                    return null;
                  },
                  text: "Search",
                  textStyle: Theme.of(context).textTheme.labelLarge!,
                  keyBoardType: TextInputType.text,
                  controller: inputController,
                  prefix: Icons.search,
                  onSubmit: (String? value) async {
                    // if (_formKey.currentState!.validate()) {
                    await NewsCubit.get(context)
                        .getSearchingData(inputController.text);
                    // }
                  },
                  // onChange: (String value) async {
                  //   print(
                  //       "textEditing: ${inputController.text}, value: $value");
                  //   // if (_formKey.currentState!.validate()) {
                  //   await NewsCubit.get(context).getSearchingData(value);
                  //   // }
                  // },
                ),
                const SizedBox(height: 10),
                Expanded(
                    child: state is NewsGetSearchingLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : search.isEmpty
                            ? Center(
                                child: Text(
                                  "No DATA",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 22),
                                ),
                              )
                            : ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    ArticleItem(myArticle: search[index]),
                                itemCount: search.length,
                                separatorBuilder: (context, index) =>
                                    const MyDivider(),
                              )),
              ],
            ),
          ),
        );
      },
    );
  }
}
