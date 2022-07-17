import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/general_providers.dart';

class PaintOperateIcon extends HookConsumerWidget {
  const PaintOperateIcon({
    Key? key,
    required this.pickIcon,
    required this.function,
  }) : super(key: key);

  final Icon pickIcon;
  final Function() function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintController = ref.watch(drawControllerProvider.notifier);
    final state = ref.watch(drawControllerProvider);
    return InkWell(
      onTap: () {
        switch ("") {
          case 'delete':
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
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            !state.isEraser && function == 'pen'
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 172, 203, 255),
                      shape: BoxShape.circle,
                    ),
                  )
                : state.isEraser && function == 'eraser'
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
