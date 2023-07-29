import 'package:flutter/material.dart';
import 'package:recap_awdi/screens/websearch_screen.dart';
import 'package:recap_awdi/shared/components.dart';

class ArticleItem extends StatelessWidget {
  final Map myArticle;
  const ArticleItem({super.key, required this.myArticle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 100,
      child: GestureDetector(
        onTap: () {
          navigateTo(
              context,
              WebSearchScreen(
                  articleURL: myArticle["url"]));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              //? First, we try this way to add the image, img inside the decoration
              // height: 100,
              // decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(12),
              // image: DecorationImage(
              //   image: NetworkImage(
              //     myArticle["urlToImage"].toString(),
              //   ),
              //   onError: (obj, trace) => const Icon(Icons.person),
              // ),
              // ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                //? second, we used 2 packages, progressive, extendedImage (here is one:)
                // clipBehavior: Clip.antiAliasWithSaveLayer,
                // child: ExtendedImage.network(
                //   myArticle["urlToImage"].toString(),
                //   width: double.infinity,
                //   height: 100,
                //   fit: BoxFit.cover,
                //   cache: true,
                //   // border: Border.all(color: Colors.red, width: 1.0),
                //   // shape: BoxShape.rectangle,
                //   // borderRadius:
                //   //     const BorderRadius.all(Radius.circular(12.0)),
                //   // cancelToken: CancellationToken(),
                // ),
                //? lastly, I choosed this one, with animation, onError , onWaiting images.
                child: (myArticle["urlToImage"] == null)
                    ? Image.asset("assets/images/placeholder.jpg")
                    : FadeInImage.assetNetwork(
                        placeholder: "assets/images/placeholder.jpg",
                        image: myArticle["urlToImage"].toString(),
                        fit: BoxFit.cover,
                        height: 100,
                        fadeInDuration: const Duration(milliseconds: 300),
                        fadeOutDuration: const Duration(milliseconds: 300),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            "assets/images/no_image.png",
                            fit: BoxFit.cover,
                          );
                        },
                      ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      myArticle["title"],
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    myArticle["publishedAt"].toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20),
      child: Divider(
        color: Colors.white24,
        height: .3,
      ),
    );
  }
}
