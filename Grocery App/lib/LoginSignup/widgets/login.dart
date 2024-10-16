import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/Home/Widgets/homemain.dart';
import 'package:mohit_bloc_1/LoginSignup/bloc/loginsignup_bloc.dart';
import 'package:mohit_bloc_1/LoginSignup/widgets/signup.dart';
import 'package:mohit_bloc_1/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginUsername = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginsignupBloc, LoginsignupState>(
        listener: (context, state) {
          if (state is OnSignupPage) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          }
          if (state is LoginSuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                "Welcome To Grocy",
                style: TextStyle(color: Colors.green),
              )),
            );
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeMainPage(
                          custName: loginUsername.text,
                        )));
          }
          if (state is LoginUnsuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                "Please fill all the Credentials",
                style: TextStyle(color: Colors.red),
              )),
            );
          }
          if (state is PasswordLength) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                "Password should be more than 6 Characters",
                style: TextStyle(color: Colors.red),
              )),
            );
          }
        },
        builder: (context, state) {
          if (state is LoginSignupLoading) {
            Duration(seconds: 3);
            return Center(child: CircularProgressIndicator.adaptive());
          }
          return SingleChildScrollView(
            child: Container(
              height: 900,
              width: 424,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 236, 236)),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 300,
                    width: 450,
                    child: Image.asset(
                      "assets/login/login.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Text(
                    'Introduce Yourself',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                    child: TextFormField(
                      controller: loginUsername,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_2_sharp),
                        hintText: 'Username Please',
                        focusColor: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 50),
                    child: TextFormField(
                      controller: loginPassword,
                      cursorColor: Colors.black,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password_sharp),
                        hintText: 'Password Please',
                        focusColor: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<LoginsignupBloc>().add(LoginToGrocy(
                          username: loginUsername.text,
                          password: loginPassword.text));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          gradient: LinearGradient(stops: [
                            0.0,
                            1.0
                          ], colors: [
                            const Color.fromARGB(255, 108, 25, 176),
                            const Color.fromARGB(255, 206, 146, 146)
                          ])),
                      child: Row(
                        children: [
                          Text(
                            '            Login ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.login,
                            weight: 0.1,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New Customer?',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<LoginsignupBloc>().add(GoToSignup());
                        },
                        child: Text(
                          ' SignUp',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
