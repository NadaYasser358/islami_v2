import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quraan2/home/tabs/quraan/sura_details.dart';
import 'package:quraan2/home/tabs/quraan/sura_listtile_widget.dart';
import 'package:quraan2/providers/most_recent_provider.dart';
import 'package:quraan2/style/assets.dart';
import 'package:quraan2/style/colors.dart';
import 'package:quraan2/style/font_styles.dart';
import 'package:quraan2/style/suras_meta_data.dart';

import 'most_recently_part.dart';

class QuraanTab extends StatefulWidget {
  const QuraanTab({super.key});

  @override
  State<QuraanTab> createState() => _QuraanTabState();
}

class _QuraanTabState extends State<QuraanTab> {
  List<int> indeces=List.generate(114, (index) => index,);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    MostRecentProvider provider=Provider.of<MostRecentProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (value) {
                  getIndeces(value);
                },
                cursorColor: AppColors.primaryColor,
                style: Fonts.bold16White,
                decoration: InputDecoration(
                  fillColor: Colors.black45,
                  filled: true,
                  hint: Text('Sura Name', style: Fonts.bold16White),
                  prefixIcon: ImageIcon(
                    AssetImage(Assets.quraanIcon),
                    color: Colors.amber,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2BE7F)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2BE7F)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              MostRecentlyPart(),
              SizedBox(height: height * 0.02),
              Text('Sura List', style: Fonts.bold16White),
              SizedBox(height: height * 0.01),
              SizedBox(
                height: provider.mostRecent.isNotEmpty? height*0.3 : height*0.7,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => InkWell(child: SuraListTile(height: height,index: indeces[index],),onTap: (){
                    provider.writeMostRecent(indeces[index]);
                    Navigator.pushNamed(context, SuraDetails.routeName, arguments: indeces[index]);
                  },),
                  separatorBuilder: (context, index) => Divider(
                    color: AppColors.whiteColor,
                    thickness: 1,
                    endIndent: width * 0.1,
                    indent: width * 0.1,
                  ),
                  itemCount: indeces.length,
                ),
              ),
            ],
          ),
        
      ),
    );

  }
  void getIndeces(String value) {
    List<int> newIndeces=[];
    for(int i=0;i<SuraMetaData.arabicQuranSura.length;i++){
      if(SuraMetaData.arabicQuranSura[i].contains(value)){
        newIndeces.add(i);
      }
      else if(SuraMetaData.englishQuranSura[i].toLowerCase().contains(value.toLowerCase()))
      {
        newIndeces.add(i);
      }
    }
    indeces=newIndeces;
    setState(() {

    });
  }
}


