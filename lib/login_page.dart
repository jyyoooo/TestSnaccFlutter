import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/landing_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String logo = 'snack ';
  

  final _userNameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  // final bool _dataMatch = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // getData(context);
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Container(
        decoration:const  BoxDecoration(
          gradient: LinearGradient(colors: [
          Colors.amberAccent,
            Colors.white],
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),
        child: ListView(
          children: [Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                      child: Text(
                    logo,
                    style:const TextStyle(
                      
                      color: Colors.black54,
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.1,
                      // backgroundColor: Colors.amber,
                    ),
                  )),
                  Image.asset(
                        'assets\\images\\hero.png',
                        width: 150,
                        height: 150,
                      ),
                  const SizedBox(height: 10),
                  TextFormField(
                    
                    controller: _userNameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(fontFamily: 'RobotoMono',fontStyle: FontStyle.italic ,color: Colors.grey),
                      filled: true,
                      
                      fillColor: Color.fromARGB(255, 233, 233, 233),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      border: OutlineInputBorder(
                          // borderSide: BorderSide.none,
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(15), left: Radius.circular(15))),
                    ),
        
                    validator: (value) {
                    
                      if(value == null || value.isEmpty){
                      return 'Enter your username';
                    }else{
                      return null;
                    }
                    },
        
                    
        
                  ),
                  const SizedBox(height: 10),
            
                  TextFormField(
                    controller: _passwordCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontFamily: 'RobotoMono',color: Colors.grey),
                      filled: true,
                      fillColor: Color.fromARGB(255, 240, 240, 240),
                      
                      contentPadding: EdgeInsets.all(10),
                      
                      border: OutlineInputBorder(
                        
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(15), left: Radius.circular(15))),
                    ),
        
                     validator: (value) {
                     
                      if(value == null || value.isEmpty){
                      return 'Enter your password';
                    }else{
                      return null;
                    }
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    // child: Text('Username and Password doesnt match',style: TextStyle(color: Colors.red),),
                  ),
            
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      ElevatedButton(
                          
                          style:
                    
                           ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.yellowAccent[700], 
                                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                 
                                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),) 
                          ),
                          onPressed: () {
                            
                            if(_formKey.currentState!.validate()){
                              checkLogin(context);
                            }
                            else{
                              print('error bro, no details entered :(.');
                            }
                            
                          },
                          
                          child: const Text('Log In')),
                    ],
                  ),
                  // Text(_displayText),
                  
                ],
              ),
            ),
          ),]
        ),
      ),
      
    );
  }

  void checkLogin(BuildContext ctx) async{
    final userName = _userNameCtrl.text;
    final password = _passwordCtrl.text;

    if (userName == 'jyyoooo' &&  password == 'jyo@123') {
      print('The Username and Password Matches!!');

      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(saveKeyValue, true);

      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=>LandingPage()));

    } else {
      const errMsg =
          'Username and Password is wraaaang!!';
          print('The Username and Password you have entered does not match');
      // snackbar

      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
          margin:  EdgeInsets.all(10),
          content: Text(errMsg)));

      // popup - alert dialogue

      // showDialog(
      //     context: (ctx),
      //     builder: (ctx1) {
      //       return AlertDialog(
      //           title: Text('Oopsie!!'),
      //           content: Text(_errMsg),
      //           actions: [TextButton(onPressed: () {
      //             Navigator.of(ctx1).pop();
      //           }, child: Text('OK'))]);
      //     });

      // show text
    }
  }

  // Future<void> saveData() async {
  //   print(_textcontroller.text);

  //   // SHARED PREF
  //   final sharedpref = await SharedPreferences.getInstance();

  //   // SAVE VALUE
  //   await sharedpref.setString('saved_value', _textcontroller.text);
  // }

  // Future<void> getData(BuildContext context) async {
  //   final sharedPref = await SharedPreferences.getInstance();

  //   final savedValue = sharedPref.getString('saved_value');

  //   if (savedValue != null) {
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (ctx) => ScreenTwo()));
  //   }
  // }
}
