import 'package:flutter/material.dart';
import 'package:quraan2/home/tabs/hadith/hadith.dart';
import 'package:quraan2/home/tabs/quraan/quraan_tab.dart';
import 'package:quraan2/home/tabs/radio/radio.dart';
import 'package:quraan2/home/tabs/sebha/sebha.dart';
import 'package:quraan2/home/tabs/time/time.dart';
import 'package:quraan2/style/assets.dart';
import 'package:quraan2/style/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {

    List<Widget> tabs=[
      QuraanTab(),
      Hadith(),
      Sebha(),
      RadioTab(),
      Time()
    ];
    List<String> backgroundsList =[
      Assets.quraanBg,
      Assets.hadithBg,
      Assets.sebhaBg,
      Assets.radioBg,
      Assets.timeBg
    ];
    return Scaffold(

      backgroundColor: Colors.transparent,
      //appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(backgroundsList[selectedIndex]),fit: BoxFit.fill)
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(Assets.topLogo,height: 170,width: 300,),
              tabs[selectedIndex],
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value){
          selectedIndex=value;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(
            icon: buildNavItem(image: Assets.quraanIcon,index: 0),
            label: "Qur'an",
          ),
          BottomNavigationBarItem(
            icon: buildNavItem(image: Assets.hadithIcon,index: 1),
            label: 'Hadith',
          ),
          BottomNavigationBarItem(
            icon: buildNavItem(image: Assets.sebhaIcon,index: 2),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: buildNavItem(image: Assets.radioIcon,index: 3),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: buildNavItem(image: Assets.timeIcon,index: 4),
            label: 'Time',
          )
        ],
      ),
    );
  }

  Widget buildNavItem({required String image, required int index}){
    return index==selectedIndex ?
        Container(
          padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20  ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.greyColor
          ),
          child: ImageIcon(AssetImage(image)),
        ):ImageIcon(AssetImage(image));

  }

}
