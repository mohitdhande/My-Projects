import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoproviderdb_1/loginpro.dart';
import 'package:todoproviderdb_1/signup.dart';
import 'package:todoproviderdb_1/todohomepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60)),
                color: const Color.fromARGB(255, 222, 203, 225),
                gradient: LinearGradient(
                  stops: [0.3, 0.8],
                  colors: [
                    const Color.fromARGB(255, 206, 168, 168),
                    const Color.fromARGB(255, 205, 122, 122)
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        "WELCOME",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 60,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: name,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_2_outlined),
                            prefixIconColor: Colors.white,
                            hintText: 'Enter Username',
                            labelText: 'Username',
                            focusColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: pass,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_outlined),
                          prefixIconColor: Colors.white,
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          focusColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () async {
                var nameU = name.text;
                var passP = pass.text;
                if (nameU.isNotEmpty && passP.isNotEmpty) {
                  bool check = await context
                      .read<Loginpro>()
                      .proValidate(password: passP);
                  if (check) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Successfully")));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TodoHome(
                                  Customer: nameU,
                                )));
                    name.clear();
                    pass.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      "Invalid Credentials",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    "Please enter the required details!!!",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )));
                }
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(26, 10, 20, 10),
                height: 60,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    stops: [0.3, 0.8],
                    colors: [
                      const Color.fromARGB(255, 206, 168, 168),
                      const Color.fromARGB(255, 205, 122, 122)
                    ],
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New User?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Container(child: Image.asset("assets/loginImage.png")),
          ],
        ),
      ),
    ));
  }
}
