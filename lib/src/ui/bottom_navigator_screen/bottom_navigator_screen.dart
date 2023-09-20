import 'package:flutter/material.dart';
import 'package:hulu/src/ui/downloads/download_screen.dart';
import 'package:hulu/src/ui/login/login_screen.dart';
import 'package:hulu/src/ui/main/movie_screen.dart';
import 'package:hulu/src/ui/main/tv_screen.dart';
import 'package:hulu/src/ui/onboard/onboard_screen.dart';
import 'package:hulu/src/ui/search/poster_screen/poster_screen.dart';
import 'package:hulu/src/ui/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}
int selectedIndex=0;
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).iconTheme.color,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        currentIndex: selectedIndex,
        onTap: (i){
          setState(() {
            selectedIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,size: 24,),label: "Tv Series"),
          BottomNavigationBarItem(icon: Icon(Icons.movie_creation_outlined,size: 24,),label: "Movies"),
          BottomNavigationBarItem(icon: Icon(Icons.slow_motion_video,size: 24,),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.download,size: 24,),label: "Downloads"),
        ],
      ),
    );
  }
  List<Widget> screen = [
    TvScreen(),
    MovieScreen(),
    PosterScreen(),
    DownloadScreen(),
  ];
}
