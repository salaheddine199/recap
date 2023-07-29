import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recap_awdi/cubit/news_cubit.dart';
import 'package:recap_awdi/screens/health_screen.dart';
import 'package:recap_awdi/screens/sports_screen.dart';
import 'package:recap_awdi/screens/tech_screen.dart';

import '../screens/my_drawer.dart';
import '../screens/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  final List<StatelessWidget> _listScreens = const [
    TechnologyScreen(),
    SportScreen(),
    HealthScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, NewsState state) {
        // here do whatever you want based on the state it's running
      },
      builder: (BuildContext context, NewsState state) {
        return Scaffold(
          drawer: const MyDrawer(),
          appBar: AppBar(
            title: const Text("News Application"),
            actions: [
              IconButton(
                icon: const Icon(Icons.brightness_4_outlined),
                onPressed: () async {
                  await NewsCubit.get(context).changeDarkMode();
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // navigateTo(context, SearchScreen());
                  NewsCubit.get(context).search = [];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  ).then((value) {
                    NewsCubit.get(context).search = [];
                  });
                },
              ),
            ],
          ),
          body: CustomRefreshIndicator(
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return const Icon(
                  Icons.refresh,
                  size: 20,
                );
              },
            ),
            onRefresh: () => myAsyncRefreshFunction(
              NewsCubit.get(context).currentIndex,
              context,
            ),
            child: FutureBuilder(
              future: Connectivity().checkConnectivity(),
              builder: (context, snapshot) {
                print("SnapshotData = ConnecetionState = ${snapshot.data}");
                if (snapshot.data == ConnectivityResult.none) {
                  return Center(
                    child: Text(
                      "No Internet",
                      style: Theme.of(context).textTheme.displaySmall!,
                    ),
                  );
                } else {
                  return _listScreens[NewsCubit.get(context).currentIndex];
                }
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: NewsCubit.get(context).currentIndex,
            onTap: NewsCubit.get(context).changeBottomNavBar,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.phonelink_rounded,
                ),
                label: "Technology",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_soccer_rounded,
                ),
                label: "Sports",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.health_and_safety_outlined,
                ),
                label: "Health",
              ),
            ],
          ),
        );
      },
    );
  }

  Future myAsyncRefreshFunction(int currentIndex, context) async {
    switch (currentIndex) {
      case 0:
        NewsCubit.get(context).getTechData();
        break;
      case 1:
        NewsCubit.get(context).getSportsData();
        break;
      case 2:
        NewsCubit.get(context).getHealthData();
        break;
    }
  }
}
