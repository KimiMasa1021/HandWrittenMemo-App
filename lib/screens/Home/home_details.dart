import 'package:flutter/material.dart';
import 'package:zen03/model/picture_model.dart';
import '../../common/common.dart';

class PictureDetails extends StatelessWidget {
  const PictureDetails({Key? key, required this.data}) : super(key: key);
  final Picture data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(gradient: gradation01),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Text(data.title!, style: textStyleBold40),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    child: Image(
                      image: NetworkImage(data.thumbnailUrl!),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.share, size: 30),
                      const SizedBox(width: 10),
                      Text("シェアする", style: textStyleBold20)
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.download, size: 30),
                      const SizedBox(width: 10),
                      Text("ダウンロードする", style: textStyleBold20)
                    ],
                  ),
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
