import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cache_helper.dart';
import 'states.dart';

class MyAppCubit extends Cubit<MyAppStates> {
  MyAppCubit(MyAppStates initialState)
      : super(initialState);

  static MyAppCubit get(context) => BlocProvider.of(context);

  int counter = 0;
  void incrementCounter() {
    counter++;
    emit(CounterIncrementState());
  }

  bool isLight = CacheHelper.getLightMode();

  void changeMode(bool newValue) {
    isLight = newValue;
    if (isLight == true) {
      CacheHelper.setLightMode(val: true);
      print("Theme Mode changed to light mode");
    } else {
      CacheHelper.setLightMode(val: false);
      print("Theme Mode changed to dark mode");
    }

    emit(ChangeThemeState());
  }

}
