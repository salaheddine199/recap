import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../shared/network/cache_helper.dart';
import '../shared/network/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  // botom navigation bar:
  int currentIndex = 1;
  void changeBottomNavBar(int index) {
    if (index != currentIndex) {
      currentIndex = index;
      emit(NewsBottomNav());
    }
    // In case you remove get...Data from NewsLayout, and you want to get the data
    // not at one time, ki yd5l fi tech yjiw tech, yd5l sport yjiw sport
    if (currentIndex == 0 && technology.isEmpty) {
      print("hhhhhhhhhhhhh");
      getTechData();
    } else if (currentIndex == 1 && sports.isEmpty) {
      getSportsData();
    } else if (currentIndex == 2 && health.isEmpty) {
      getHealthData();
    }
  }

  // In case you remove get...Data from NewsLayout, and you want to get the data
  // not at one time, ki yd5l fi tech yjiw tech, yd5l sport yjiw sport
  // hdi lwla mzl mladch user marah bsh lwla lazm t5rj, l5rin yjiw li ydl navbar
  void getCurrentScreen() {
    if (currentIndex == 0) {
      getTechData();
    } else if (currentIndex == 1) {
      getSportsData();
    } else if (currentIndex == 2) {
      getHealthData();
    }
  }

  // change dark mode:
  Future<void> changeDarkMode() async {
    bool isDarkMode = CacheHelper.getDarkMode();
    await CacheHelper.setDarkMode(value: !isDarkMode);
    emit(NewsDarkMode());
  }

  // getting data using api from backend(api source in our case):
  List health = [];
  List technology = [];
  List sports = [];
  List search = [];

  void getSportsData() async {
    emit(NewsGetSportsLoading());
    Response? result = await DioHelper.getSportsData();
    if (result != null) {
      sports = result.data["articles"];
      // print(result.data["articles"][0]['title']);
      // print(sports["articles"][0]['title']);
      emit(NewsGetSportsDone());
    } else {
      emit(NewsGetSportsFailed());
    }
  }

  void getHealthData() async {
    emit(NewsGetHealthLoading());
    Response? result = await DioHelper.getHealthData();
    if (result != null) {
      health = result.data["articles"];
      // print(result.data["articles"][0]['title']);
      // print(health["articles"][0]['title']);
      emit(NewsGetHealthDone());
    } else {
      emit(NewsGetHealthFailed());
    }
  }

  void getTechData() async {
    emit(NewsGetTechnologyLoading());
    Response? result = await DioHelper.getTechData();
    if (result != null) {
      technology = result.data["articles"];
      // print(result.data["articles"][0]['title']);
      // print(technology["articles"][0]['title']);
      emit(NewsGetTechnologyDone());
    } else {
      emit(NewsGetTechnologyFailed());
    }
  }

  Future getSearchingData(String searching) async {
    emit(NewsGetSearchingLoading());
    Response? result = await DioHelper.searchData(searching);
    if (result != null) {
      search = result.data["articles"];
      emit(NewsGetSearchingDone());
    } else {
      search = [];
      emit(NewsGetSearchingFailed());
    }
  }
}
