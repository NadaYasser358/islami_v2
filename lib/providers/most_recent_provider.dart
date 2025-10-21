import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecent = [];
  static const String mostRecentKey = 'most_recent_key';

  void writeMostRecent(int newIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSuras =
        await prefs.getStringList(mostRecentKey) ?? [];
    if (mostRecentSuras.contains('$newIndex')) {
      mostRecentSuras.remove('$newIndex');
      mostRecentSuras.insert(0, '$newIndex');
    } else {
      mostRecentSuras.insert(0, '$newIndex');
    }
    mostRecentSuras = mostRecentSuras.take(5).toList();
    await prefs.setStringList(mostRecentKey, mostRecentSuras);
    mostRecent = mostRecentSuras.map((e) => int.parse(e)).toList();
    notifyListeners();
  }

  void readMostRecent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recentListAsString =
        await prefs.getStringList(mostRecentKey) ?? [];
    mostRecent = recentListAsString.map((e) => int.parse(e)).toList();
    notifyListeners();
  }
}
