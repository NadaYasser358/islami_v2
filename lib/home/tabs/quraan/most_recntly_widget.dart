import 'package:flutter/material.dart';
import 'package:quraan2/style/suras_meta_data.dart';

import '../../../style/assets.dart';
import '../../../style/colors.dart';
import '../../../style/font_styles.dart';

class MostRecentlyWidget extends StatelessWidget {
  const MostRecentlyWidget({
    super.key,
    required this.width,
    required this.height,
    required this.index,
  });

  final double width;
  final double height;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 7),
      width: width * 0.7,
      height: height * 0.17,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                SuraMetaData.englishQuranSura[index],
                style: Fonts.bold20Black,
              ),
              Text(
                SuraMetaData.arabicQuranSura[index],
                style: Fonts.bold20Black,
              ),
              Text(
                '${SuraMetaData.AyaNumber[index]} verses',
                style: Fonts.bold16Black,
              ),
            ],
          ),
          Image(image: AssetImage(Assets.mostRecently)),
        ],
      ),
    );
  }
}
