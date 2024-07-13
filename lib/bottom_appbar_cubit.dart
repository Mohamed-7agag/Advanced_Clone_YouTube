import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationItem { home, shorts, plus, subscription, you }

class BottomNavigationBarCubit extends Cubit<NavigationItem> {
  BottomNavigationBarCubit() : super(NavigationItem.home);

  void updateNavigationItem(NavigationItem item) {
    emit(item);
  }
}
