import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/draw_move_state.dart';

class DrawMoveController extends StateNotifier<DrawMoveState> {
  DrawMoveController() : super(const DrawMoveState());
}
