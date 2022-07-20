// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../providers/general_providers.dart';

// class ColorPicker extends HookConsumerWidget {
//   ColorPicker({Key? key, required this.pickColor}) : super(key: key);

//   Color? pickColor;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final paintController = ref.watch(drawControllerProvider.notifier);
//     final state = ref.watch(drawControllerProvider);

//     return InkWell(
//       onTap: () {
//         paintController.chageColor(pickColor!);
//       },
//       child: Stack(
//         alignment: AlignmentDirectional.center,
//         children: [
//           Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//               color: pickColor!,
//               shape: BoxShape.circle,
//             ),
//           ),
//           state.pickColor == pickColor
//               ? const Icon(
//                   Icons.brush,
//                   size: 40,
//                   color: Colors.white,
//                 )
//               : const SizedBox(),
//         ],
//       ),
//     );
//   }
// }
