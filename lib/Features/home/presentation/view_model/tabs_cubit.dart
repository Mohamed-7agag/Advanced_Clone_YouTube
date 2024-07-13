import 'package:flutter_bloc/flutter_bloc.dart';

enum TabsItems {
  compass,
  all,
  flutter,
  computerProgramming,
  food,
  sports,
  movies,
  gadgets,
  entertainment,
  math,
  live,
  podcast
}

class TabsCubit extends Cubit<TabsItems> {
  TabsCubit() : super(TabsItems.all);

  void updateTabsItem(TabsItems item) {
    emit(item);
  }
}
