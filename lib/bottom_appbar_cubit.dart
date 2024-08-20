import 'package:advanced_youtube/Core/utils/constants.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationItem { home, shorts, plus, subscription, you }

class BottomNavigationBarCubit extends Cubit<NavigationItem> {
  BottomNavigationBarCubit() : super(NavigationItem.home);

  void updateNavigationItem(NavigationItem item) {
    emit(item);
  }
}

class LocalizationCubit extends Cubit<String> {
  LocalizationCubit()
      : super(CacheHelper.getString(localeKey) == ''
            ? 'en'
            : CacheHelper.getString(localeKey));

  void updateLocalization(String locale) {
    CacheHelper.setData(key: localeKey, value: locale);
    emit(locale);
  }
}
