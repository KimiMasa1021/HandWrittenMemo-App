import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/common.dart';
import '../../../providers/general_providers.dart';

class PaintSetUpBack extends HookConsumerWidget {
  PaintSetUpBack({
    Key? key,
    required this.title,
    this.img,
  }) : super(key: key);

  final String title;
  String? img;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintSetUpController =
        ref.watch(paintSetUpControllerProvider.notifier);
    final state = ref.watch(paintSetUpControllerProvider);

    return Stack(
      children: [
        InkWell(
          onTap: () => paintSetUpController.handleRadio(img),
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      activeColor: Colors.blue,
                      value: img ?? "",
                      groupValue: state.type,
                      onChanged: paintSetUpController.handleRadio,
                    ),
                    Text(
                      title,
                      style: textStyleBold20Gray,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        image: img != null
                            ? DecorationImage(
                                image: AssetImage(img!),
                                fit: BoxFit.cover,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
