import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoproviderdb_1/loginpro.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameSignup = TextEditingController();
  TextEditingController passSignup = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/signupImage.png",
              height: 300,
              width: 300,
            ),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    gradient: LinearGradient(
                      stops: [0.3, 0.8],
                      colors: [
                        const Color.fromARGB(255, 206, 168, 168),
                        const Color.fromARGB(255, 205, 122, 122)
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "SignUp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
              child: Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  gradient: LinearGradient(
                    stops: [0.3, 0.8],
                    colors: [
                      const Color.fromARGB(255, 206, 168, 168),
                      const Color.fromARGB(255, 205, 122, 122)
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 5, right: 5),
                      child: TextFormField(
                        controller: nameSignup,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          prefixIconColor: Colors.white,
                          hintText: 'Enter Username',
                          labelText: 'Username',
                          focusColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 5, right: 5),
                      child: TextFormField(
                        controller: passSignup,
                        style: TextStyle(color: Colors.white),
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () async {
                var nameU = nameSignup.text;
                var passP = passSignup.text;
                if (nameU.isNotEmpty && passP.isNotEmpty) {
                  bool check = await context.read<Loginpro>().proInsert(
                      username: nameSignup.text, password: passSignup.text);
                  if (check) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("SignedUp Successfully")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(" SignedUp Unsuccessfully")));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please enter the required details!!!")));
                }
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(26, 10, 20, 10),
                height: 60,
                width: 150,
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
                  'SignUp',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
