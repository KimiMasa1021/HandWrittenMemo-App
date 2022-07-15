import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(const HomeState());

  void deleteTagetFlg() {
    state = state.copyWith(
      isDrag: !state.isDrag,
    );
  }

  void changeFeedBackCardWidth() {
    state = state.copyWith(
      feedBackCardWidth: 50,
    );
  }

  void changeWillAccept() {
    state = state.copyWith(isTarget: !state.isTarget);
  }
}
