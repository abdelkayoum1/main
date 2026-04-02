import 'package:ecommerce/core/approuter.dart';

import 'package:ecommerce/feature/screen/login%20and%20register/widget/container.dart';
import 'package:ecommerce/feature/screen/login%20and%20register/widget/textfieled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginn extends StatefulWidget {
  const Loginn({super.key});

  @override
  State<Loginn> createState() => _LoginnState();
}

class _LoginnState extends State<Loginn> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login Account',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),

                Text(
                  'Please,Login with register  accounts',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    //fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
                Textfieled1(
                  title: email,
                  text: 'Entrer your email',
                  prefixIcon: Icon(Icons.check),
                ),
                SizedBox(height: 10),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),

                Textfieled1(
                  title: password,
                  text: 'Entrer your Password',
                  prefixIcon: Icon(Icons.password),
                ),
                SizedBox(height: 10),
                Containerr(
                  title: 'Forget Password',
                  color: Colors.deepPurple,
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        GoRouter.of(context).push(Approuter.navbar2);
                      }
                    },
                    child: Text("Login"),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Containerr(
                  title: 'Don\'t Have  an Accounts?   register',
                  textAlign: TextAlign.center,
                  color: Colors.deepPurple,
                ),
                SizedBox(height: 20),
                Containerr(
                  title: 'on Missing orther Methode',
                  textAlign: TextAlign.center,
                  color: Colors.grey,
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/google.png', width: 30),
                    SizedBox(width: 10),
                    Text('Login in google'),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/fcb.png', width: 50),
                    SizedBox(width: 10),
                    Text('Login in facebbok'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
