import 'package:flutter/material.dart';

import '../shared/components/components.dart';
// import 'package:flutter/rendering.dart';

class LoginDesign extends StatefulWidget {
  const LoginDesign({Key? key}) : super(key: key);

  @override
  _LoginDesignState createState() => _LoginDesignState();
}

class _LoginDesignState extends State<LoginDesign> {
  bool _visiblePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log in ")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                myTextField(
                  keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if(value == null){
                        return "Email must not be null";
                      }
                      else if (value.isEmpty){
                        return "Email must not be null";}
                      return null;
                    },
                    text: "Email Address",
                  prefixIcon: const Icon(Icons.email),
                ),
                const SizedBox(
                  height: 20,
                ),
                myTextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  validator: (value) {
                    if(value == null){
                        return "Email must not be null";
                      }
                      else if (value.isEmpty){
                      return "Password must not be null";}
                    return null;
                  },
                  text: "Password",
                  prefixIcon:const  Icon(Icons.lock),
                  isPassword: _visiblePassword,
                  suffixIcon: IconButton(
                    icon: Icon(_visiblePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _visiblePassword = !_visiblePassword;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                myButton(
                    text: "login",
                    height: 45,
                    //padding: EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 50.0),
                    isUpperCase: false,
                    // radius: BorderRadius.vertical(
                    //   top: Radius.circular(35.0),
                    //   bottom: Radius.circular(16.0),
                    // ),
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                "email = ${_emailController.text}, password = ${_passwordController.text}")));
                      }
                    },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account',
                    ),
                    const SizedBox(width: 15,),
                    TextButton(
                      child: const Text("Register now"),
                      onPressed: () {},
                    ),
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
