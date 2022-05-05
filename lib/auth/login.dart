import 'package:flutter/material.dart';

import '../services/funcations/auth_funcations.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  var username = '';
  bool isLoginPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(14),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoginPage
                    ? Container()
                    : TextFormField(
                        validator: (value) {
                          if (value!.length == 0) {
                            return 'Enter User Name';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          username = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                        key: const ValueKey('username'),
                        decoration: InputDecoration(
                          labelText: 'Enter User Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length == 0) {
                      return 'Enter Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  key: const ValueKey('email'),
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length == 0) {
                      return 'Enter Password';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    password = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  key: const ValueKey('password'),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // print(email);
                        // print(username);
                        // print(password);
                        isLoginPage
                            ? signinUser(context, email, password)
                            : signupUser(context, email, password, username);
                      }
                    },
                    child: Text(isLoginPage ? 'Login' : 'SignUp'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLoginPage = !isLoginPage;
                    });
                  },
                  child: Text(isLoginPage ? 'Signup' : 'Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
