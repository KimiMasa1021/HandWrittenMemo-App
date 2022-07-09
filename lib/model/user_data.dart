import 'package:zen03/model/picture_state.dart';

class UserData {
  final String? uid;
  List<PictureState>? data;

  UserData({this.uid});

  @override
  String toString() {
    String userdt = '$uid';
    data?.forEach((element) {
      userdt = '$userdt $element';
    });
    return userdt;
  }
}
