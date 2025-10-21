import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quraan2/providers/most_recent_provider.dart';
import 'package:quraan2/style/assets.dart';
import 'package:quraan2/style/colors.dart';
import 'package:quraan2/style/suras_meta_data.dart';

import '../../../style/font_styles.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});
  static const String routeName = 'sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late List<String> ayat = [];
  late MostRecentProvider provider;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    provider.readMostRecent();
  }
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    provider = Provider.of<MostRecentProvider>(context);
    void getAyat(int index) async {
      String total = await rootBundle.loadString('assets/Suras/${index + 1}.txt');
      ayat = total.split('\n');
      setState(() {

      });
    }
    if (ayat.isEmpty) {
      getAyat(index);
    }

    return Scaffold(
      appBar: AppBar(title: Text(SuraMetaData.englishQuranSura[index])),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: AssetImage(Assets.leftDetails)),
                Text(
                  SuraMetaData.arabicQuranSura[index],
                  style: Fonts.bold24Primary,
                ),
                Image(image: AssetImage(Assets.rightDetails)),
              ],
            ),
            Expanded(
              child: ayat.isEmpty
                  ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
                  : SingleChildScrollView(
                    child: Text(
                        ayat.join(' ** '),
                        style: Fonts.bold20Primary,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                  ),
            ),
            Image(image: AssetImage(Assets.bottomDetails)),
          ],
        ),
      ),
    );

  }


}
