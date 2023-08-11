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
        title: Text('Snacc'),
        actions: [
          IconButton(
              onPressed: () {
                signOut(context);
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
                  leading: isSquareAvatar
                      ? Container(
                          width: 60,
                          height: 60,
                          // color: Colors.blue, // Set your desired color for square avatars
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
}
