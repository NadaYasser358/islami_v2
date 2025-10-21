import 'package:flutter/material.dart';
import 'package:quraan2/style/suras_meta_data.dart';

import '../../../style/assets.dart';
import '../../../style/font_styles.dart';

class SuraListTile extends StatelessWidget {
  const SuraListTile({
    super.key,
    required this.height,
    required this.index
  });

  final double height;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minTileHeight: height*0.07,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Text('${index + 1}',style: Fonts.bold16White,),
          Image(image: AssetImage(Assets.suraNum)),
        ],
      ),
      trailing: Text(SuraMetaData.arabicQuranSura[index],style: Fonts.bold20White,),
      title: Text(SuraMetaData.englishQuranSura[index],style: Fonts.bold20White,),
      subtitle: Text(SuraMetaData.AyaNumber[index],style: Fonts.bold14White,),
    );
  }
}