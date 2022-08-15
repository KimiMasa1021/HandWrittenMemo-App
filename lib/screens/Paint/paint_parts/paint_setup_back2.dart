import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/common.dart';
import '../../../providers/general_providers.dart';

class PaintSetUpBack2 extends HookConsumerWidget {
  const PaintSetUpBack2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintSetUpController =
        ref.watch(paintSetUpControllerProvider.notifier);
    final state = ref.watch(paintSetUpControllerProvider);
    return Row(
      children: [
        state.image != null
            ? Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            "画像",
                            style: textStyleBold20Gray,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: state.image != null
                                    ? DecorationImage(
                                        image: FileImage(state.image!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-1, -1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Radio(
                        activeColor: Colors.blue,
                        value: "fromDevice",
                        groupValue: state.type,
                        onChanged: paintSetUpController.handleRadio,
                      ),
                    ),
                  )
                ],
              )
            : const SizedBox(),
        Container(
          width: 150,
          margin: const EdgeInsets.only(right: 10),
          child: DottedBorder(
            dashPattern: const [10.0, 10.0],
            strokeWidth: 1.0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 150,
              decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      await paintSetUpController.getImageFromGallery();
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightBlue[400],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.file_download,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Text("本体から画像を選ぶ"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await paintSetUpController.getImageFromCamera();
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightBlue[400],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.linked_camera,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Text("写真を撮る"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
