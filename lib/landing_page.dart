import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/home_page.dart';
import 'package:test2/profile_page.dart';
import 'package:test2/login_page.dart';
import 'package:test2/search_page.dart';

// import 'package:test2/profilePage.dart';
// import 'package:test2/searchPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPage = 0;
    final pages = const [ Home(), SearchPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Text('Snacc',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        )),
        actions: [
          Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.fromLTRB(10, 10, 5, 6),
            // color: Colors.white,
            child: IconButton(
              color: Colors.red,
              // visualDensity: VisualDensity(horizontal: 5),
                onPressed: () {
                  _showLogoutConfirmationDialog(context);
                  // signOut(context);
                },
                icon: const Icon(Icons.logout)),
          ),
          const SizedBox(width: 10),
        ],
      ),

       body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme:const IconThemeData(size: 35 ),
        backgroundColor:   Colors.black45,
        selectedItemColor: Colors.amber[300],
        unselectedItemColor: Colors.white,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: const [
          
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Profile',
          ),
        ],elevation: 0,
      ),
    );
  }

  

  // SIGNOUT STUFFS
  signOut(ctx) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) =>const LoginPage()), (route) => false);
  }

  _showLogoutConfirmationDialog(BuildContext ctx) async {
    return showDialog<void>(
      context: ctx,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Hey Wait!!'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Cancel',style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
            TextButton(
              
              child: const Text('Logout',style: TextStyle(color: Colors.red),),
              onPressed: () {
                Navigator.of(ctx).pop();
                signOut(ctx);
              },
            ),
          ],
        );
      },
    );
  }
}
