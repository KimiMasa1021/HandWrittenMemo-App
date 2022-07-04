import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/general_providers.dart';

class PaintOperateIcon extends HookConsumerWidget {
  const PaintOperateIcon({
    Key? key,
    required this.pickIcon,
    required this.funcFlg,
  }) : super(key: key);

  final Icon pickIcon;
  final String funcFlg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintController = ref.watch(drawControllerProvider.notifier);
    final state = ref.watch(drawControllerProvider);
    return InkWell(
      onTap: () {
        switch (funcFlg) {
          case 'delete':
            paintController.clear();
            break;
          case 'undo':
            paintController.undo();
            break;
          case 'eraser':
            paintController.chageEraser(Colors.white);
            break;
          case 'pen':
            paintController.penMode();
            break;
          default:
            break;
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            !state.isEraser && funcFlg == 'pen'
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 172, 203, 255),
                      shape: BoxShape.circle,
                    ),
                  )
                : state.isEraser && funcFlg == 'eraser'
                    ? Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 172, 203, 255),
                          shape: BoxShape.circle,
                        ),
                      )
                    : const SizedBox(),
            pickIcon,
          ],
        ),
      ),
    );
  }
}
