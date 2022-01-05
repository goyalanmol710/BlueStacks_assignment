import 'package:bluestacks_assignment/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool phoneNumberIsValid = true;
  bool passwordIsValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        TextField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            errorText: phoneNumberIsValid
                                ? null
                                : 'Must have range between 3-11 digits',
                            border: const OutlineInputBorder(),
                            labelText: 'Phone Number',
                            hintText: 'Enter valid Phone Number',
                          ),
                          onChanged: (value) {
                            if (value.length < 3 || value.length > 11) {
                              setState(() {
                                phoneNumberIsValid = false;
                              });
                            } else {
                              setState(() {
                                phoneNumberIsValid = true;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        errorText: passwordIsValid
                            ? null
                            : 'Must have range between 3-11 digits',
                        labelText: 'Password',
                        hintText: 'Enter secure password',
                      ),
                      onChanged: (value) {
                        if (value.length < 3 || value.length > 11) {
                          setState(() {
                            passwordIsValid = false;
                          });
                        } else {
                          setState(() {
                            passwordIsValid = true;
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (phoneNumberController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty &&
                          phoneNumberIsValid &&
                          passwordIsValid) {
                        if (checkTheData(phoneNumberController.text,
                            passwordController.text)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomeScreen()));
                        }
                      }
                    },
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.blue.withOpacity(
                          .5,
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(vertical: 10)),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return (phoneNumberController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty &&
                                phoneNumberIsValid &&
                                passwordIsValid)
                            ? Colors.blue
                            : Colors.blue.withOpacity(
                                .5); // Defer to the widget's default.
                      }),
                      elevation: MaterialStateProperty.all(5),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('New User? Create Account')
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  bool checkTheData(String phoneNumber, String password) {
    bool isCorrect = false;
    List<Map<String, String>> data = [
      {'phoneNumber': '9898989898', 'password': 'password123'},
      {'phoneNumber': '9876543210', 'password': 'password123'}
    ];

    for (var element in data) {
      if (element['phoneNumber'] == phoneNumber &&
          element['password'] == password) {
        isCorrect = true;
      }
    }
    return isCorrect;
  }
}
