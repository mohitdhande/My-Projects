import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/LoginSignup/bloc/loginsignup_bloc.dart';
import 'package:mohit_bloc_1/LoginSignup/widgets/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController signupUsername = TextEditingController();
  final TextEditingController signupPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginsignupBloc, LoginsignupState>(
      listener: (context, state) {
        if (state is OnLoginPage) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
        if (state is SignUpSuccessful) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "SignUp Successfully",
            style: TextStyle(color: Colors.green),
          )));
        }
        if (state is SignUpUnsuccessful) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Please fill the Credentials",
            style: TextStyle(color: Colors.red),
          )));
        }
        if (state is PasswordLength) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Password should be more than 6 Characters",
            style: TextStyle(color: Colors.red),
          )));
        }
        if (state is AlreadySignedUp) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "You are already Registered",
            style: TextStyle(color: Colors.red),
          )));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            height: 900,
            width: 424,
            decoration:
                BoxDecoration(color: const Color.fromARGB(255, 238, 236, 236)),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: 300,
                  width: 450,
                  child: Image.asset(
                    "assets/signup/signup.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Text(
                  'Register Yourself',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                  child: TextFormField(
                    controller: signupUsername,
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
                    controller: signupPassword,
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
                    context.read<LoginsignupBloc>().add(SignupAddToDB(
                        username: signupUsername.text,
                        password: signupPassword.text));
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
                          '            SignUp ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
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
                    Icon(Icons.arrow_back_ios_outlined),
                    Text(
                      ' Back to',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<LoginsignupBloc>().add(GoBackToLogin());
                      },
                      child: Text(
                        ' Login',
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
    ));
  }
}
