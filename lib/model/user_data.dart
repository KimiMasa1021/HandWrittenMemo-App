import 'package:zen03/model/picture_model.dart';

class UserData {
  final String? uid;
  List<Picture>? data;

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
