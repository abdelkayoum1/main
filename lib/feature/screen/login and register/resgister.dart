import 'package:ecommerce/core/approuter.dart';
import 'package:ecommerce/feature/screen/Checkout/screen/checkout/widjet/textfieled.dart';
import 'package:ecommerce/feature/screen/locationn/screnn/widget/textfieledd.dart';
import 'package:ecommerce/feature/screen/login%20and%20register/data/repo/login_repo_imp.dart';
import 'package:ecommerce/feature/screen/login%20and%20register/widget/container.dart';
import 'package:ecommerce/feature/screen/login%20and%20register/widget/login_cubit%20%20and%20register_cubit/login_cubit_cubit.dart';
import 'package:ecommerce/feature/screen/login%20and%20register/widget/textfieled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController username = TextEditingController();

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
                  'Register Account',
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
                  'Username',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
                Textfieled1(
                  obscureText: false,
                  title: username,
                  text: 'Entrer your Username',
                  prefixIcon: Icon(Icons.person),
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
                  obscureText: false,
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
                  obscureText: true,
                  title: password,
                  text: 'Entrer your Password',
                  prefixIcon: Icon(Icons.password),
                  sufixIcon: Icon(Icons.visibility),
                ),
                SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: BlocConsumer<LoginCubitCubit, LoginCubitState>(
                    listener: (context, state) {
                      if (state is RegisterCubitsucces) {
                        // GoRouter.of(context).push(Approuter.login);
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('login succes')));
                      } else if (state is RegisterCubitfailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },

                    builder: (context, state) {
                      if (state is RegisterCubitlaoding) {
                        return ElevatedButton(
                          onPressed: null,
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      print(username.text);

                      return ElevatedButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            context.read<LoginCubitCubit>().sign(
                              email.text,
                              password.text,
                              username.text,
                            );
                            print(username.text);
                          }
                        },
                        child: Text("Register"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push(Approuter.login);
                  },
                  child: Containerr(
                    title: 'youre Have  an Accounts?   Login',
                    textAlign: TextAlign.center,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 20),
                Containerr(
                  title: 'on Missing orther Methode',
                  textAlign: TextAlign.center,
                  color: Colors.grey,
                ),
                SizedBox(height: 20),

                BlocConsumer<LoginCubitCubit, LoginCubitState>(
                  listener: (context, state) {
                    if (state is Signgooglesucces) {
                      GoRouter.of(context).push(Approuter.navbar2);
                    } else if (state is Signgooglefailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },

                  builder: (context, state) {
                    if (state is Signgoogleloading) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          TextButton(
                            onPressed: null,
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        ],
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/google.png'),
                        TextButton(
                          onPressed: () async {
                            await context.read<LoginCubitCubit>().signgoogle();
                          },
                          child: Text('login google'),
                        ),
                      ],
                    );
                  },
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
