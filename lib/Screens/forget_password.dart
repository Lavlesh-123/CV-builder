
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'LoginPage.dart';

class forget_password extends StatefulWidget {
  const forget_password({Key? key}) : super(key: key);

  @override
  State<forget_password> createState() => _forget_passwordState();
}

class _forget_passwordState extends State<forget_password> {
  var forgetPasswordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return Scaffold(
      body:  Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.yellow, Colors.orangeAccent,Colors.red,Colors.pinkAccent])),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    width: mq.size.width * 0.7,
                    height: mq.size.height * 0.5,
                    child: Lottie.asset('assets/animations/forgetPassword_animation.json')),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxHeight: 70,
                        minHeight: 40,
                        maxWidth: 400,
                        minWidth: 150),
                    child: TextFormField(
                        controller: forgetPasswordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            labelText: 'Enter email',
                            suffixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter the email';
                          } else {
                            return null;
                          }
                        }),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 30,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxHeight: 50,
                      minHeight: 30,
                      maxWidth: 300,
                      minWidth: 250),
                  child: InkWell(
                    onTap: (){
                      if(formkey.currentState!.validate()){
                        var forgetPassword = forgetPasswordController.text.trim();
                        FirebaseAuth.instance.sendPasswordResetEmail(email: forgetPassword).then((value) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const login()));
                        });
                      }
                    },

                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: const Center(child: Text('Get new password in email'),),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}


