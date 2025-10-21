import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quraan2/providers/most_recent_provider.dart';

import '../../../style/font_styles.dart';
import 'most_recntly_widget.dart';

class MostRecentlyPart extends StatefulWidget {
  const MostRecentlyPart({super.key});

  @override
  State<MostRecentlyPart> createState() => _MostRecentlyPartState();
}

class _MostRecentlyPartState extends State<MostRecentlyPart> {
  late MostRecentProvider providerVar;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<MostRecentProvider>(context,listen: false).readMostRecent();
    });

  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    providerVar = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: providerVar.mostRecent.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: Fonts.bold16White),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: height * 0.17,
            width: double.infinity,
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  MostRecentlyWidget(width: width, height: height,index: providerVar.mostRecent[index],),
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.02),
              itemCount: providerVar.mostRecent.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
