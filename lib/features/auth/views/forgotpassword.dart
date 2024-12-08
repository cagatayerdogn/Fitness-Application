import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spor1/features/auth/controller/auth_controller.dart';
import 'package:spor1/features/auth/repository/auth.repository.dart';
import 'package:spor1/features/auth/views/sign_in.dart';
import 'package:spor1/home_screen.dart';

import 'sign_up.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  Future<void> _showWarningDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showResultDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Result'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('resimler/sifre.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom:
                25, // Beyaz kutunun alt kenarının ekrandan 50 piksel yukarıda olmasını sağlar
            child: Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width *
                    0.9, // Genişliği ekranın %90'ı olarak ayarlar
                height: MediaQuery.of(context).size.height *
                    0.52, // Yüksekliği ekranın %30'u olarak ayarlar
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Şifre Sıfırla",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "E-Mail Gerekli";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "E-Mail",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Consumer(
  builder: (context, ref, child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ref
                .read(authControllerProvider)
                .forgotPassword(
                  email: _emailController.text,
                )
                .then((result) {
                  if (result == 'Password reset email sent successfully.') {
                    _showResultDialog(result);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignIn(),
                      ),
                      (route) => false,
                    );
                  } else {
                    _showWarningDialog(result);
                  }
                })
                .catchError((e) {
                  _showWarningDialog('An unexpected error occurred.');
                });
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: Color.fromARGB(255, 237, 183, 75),
        minWidth: double.infinity,
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            "Şifre Sıfırla",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  },
),


                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignIn(),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            color: Color.fromARGB(255, 237, 183, 75),
                            minWidth: double.infinity,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Text(
                                "Giriş Yapmaya Geri Dön",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
