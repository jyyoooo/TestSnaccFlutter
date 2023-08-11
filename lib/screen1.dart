import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/screen2.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String name = 'snacc';

  final _userNameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  // final bool _dataMatch = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // getData(context);
    return Scaffold(
      backgroundColor: Colors.white,

      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 55, 25, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                  child: Text(
                name,
                style: TextStyle(
                  color: Colors.yellowAccent[700],
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.1,
                  // backgroundColor: Colors.amber,
                ),
              )),
              const SizedBox(height: 20),
              TextFormField(
                controller: _userNameCtrl,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Username',
                  fillColor: Color.fromARGB(255, 233, 233, 233),
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 20, 20),
                  border: OutlineInputBorder(
                      // borderSide: BorderSide.none,
                      borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(10), left: Radius.circular(10))),
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
                  
                  filled: true,
                  hintText: 'Password',
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                  contentPadding: EdgeInsets.all(10),
                  
                  border: OutlineInputBorder(
                      
                      borderRadius: BorderRadius.horizontal(
                        
                          right: Radius.circular(10), left: Radius.circular(10))),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.yellowAccent[700], // Background color
                      ),
                      onPressed: () {
                        
                        if(_formKey.currentState!.validate()){
                          checkLogin(context);
                        }
                        else{
                          print('something error bro :(.');
                        }
                        
                      },
                      child: const Text('Log In')),
                ],
              ),
              // Text(_displayText),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async{
    final _userName = _userNameCtrl.text;
    final _password = _passwordCtrl.text;

    if (_userName == _password) {
      print('The Username and Password Matches!!');

      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(saveKeyValue, true);

      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage()));

    } else {
      final _errMsg =
          'The Username and Password you have entered does not match';
          print('The Username and Password you have entered does not match');
      // snackbar

      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
          margin: EdgeInsets.all(10),
          content: Text(_errMsg)));

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
