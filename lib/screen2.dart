import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/screen1.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: Text('Snacc'),
        actions: [
          Center(child: Text('LogOut>',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),)),
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
              itemBuilder: (ctx, index) {
                bool isSquareAvatar = index % 2 == 0;
                return ListTile(
                  textColor: Colors.white,
                  title: Text('Snack item'),
                  subtitle: Text('Burger with pepsi and stuff $index'),
                  leading: isSquareAvatar?Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          child: Image.asset('assets\\images\\pepsi-cold-drink-500x500.png')
                        )
                      : CircleAvatar(
                          radius: 30,
                          child: ClipOval(child: Image.asset('assets\\images\\veg-burger-patty-500x500.png')),
                          // backgroundImage: Image.asset('assets\\images\\Screenshot 2023-05-12 191155.png'),
                        ),
                  trailing: Text('\$100'),
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
}