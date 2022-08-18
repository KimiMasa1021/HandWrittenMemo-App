import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../model/paint_setup_state.dart';

class PaintSetUpController extends StateNotifier<PaintSetUpState> {
  PaintSetUpController() : super(PaintSetUpState());

  final picker = ImagePicker();

  void handleRadio(String? val) {
    state = state.copyWith(type: val ?? "");
  }

  void handleRadio2(double? val, double width) {
    state = state.copyWith(
      height: val ?? 1,
      width: width,
    );
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile == null) return;
    File image = File(pickedFile.path);

    state = state.copyWith(
      image: image,
      type: "fromDevice",
    );
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;
    File image = File(pickedFile.path);

    state = state.copyWith(
      image: image,
      type: "fromDevice",
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
