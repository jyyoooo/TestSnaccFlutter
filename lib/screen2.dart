import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/screen1.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Snacc'),
        actions: [
          Center(
              child: Text(
            'LogOut>',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          )),
          IconButton(
              onPressed: () {
                _showLogoutConfirmationDialog(context);
                // signOut(context);
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                bool isSquareAvatar = index % 2 == 0;
                return ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  title: Text('Burgir'),
                  subtitle: Text('Burgir and pespi'),
                  leading: isSquareAvatar
                      ? Container(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                              'assets\\images\\pepsi-cold-drink-500x500.png'),
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          child: ClipOval(
                              child: Image.asset(
                                  'assets\\images\\veg-burger-patty-500x500.png')),
                        ),
                  trailing: TextButton(
                    onPressed: () {
                      _tapGesture(
                          context, "Veg burger $index", "something", ' \$100');
                    },
                    child: Text('view'),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider(
                  color: Colors.grey,
                );
              },
              itemCount: 31)),
    );
  }

  signOut(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => LoginPage()), (route) => false);
  }

  _showLogoutConfirmationDialog(BuildContext ctx) async {
    return showDialog<void>(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                // Perform the logout action here
                Navigator.of(context).pop();
                signOut(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _tapGesture(
      BuildContext context, String title, String content, String price) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(content),
                SizedBox(height: 20),
                Text(price),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close")),
            ],
          );
        });
  }
}
