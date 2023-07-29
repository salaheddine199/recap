import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recap_awdi/cubit/news_cubit.dart';
import 'package:recap_awdi/shared/bloc_observer.dart';
import 'package:recap_awdi/shared/network/dio_helper.dart';
import 'layout/news_layout.dart';
import 'shared/network/cache_helper.dart';

import 'shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getCurrentScreen(),
      //? replacing the below with the above, fetch the data not all at one time
      //? if you want to reverse it, don't forget to delete the getCurrentScreen function
      //? as well as , the code that refresh in cubit.changeBottomNavBar function
      // ..getSportsData()
      // ..getHealthData()
      // ..getTechData()
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Api Flutter',
            themeMode:
                CacheHelper.getDarkMode() ? ThemeMode.dark : ThemeMode.light,
            darkTheme: darkTheme,
            theme: lightTheme,
            home: Directionality(
              textDirection: CacheHelper.getEnglishLanguage()
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              // textDirection: TextDirection.rtl,
              child: const NewsLayout(),
            ),
          );
        },
      ),
    );
  }
}
