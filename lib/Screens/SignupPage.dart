// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../utils/Tost.dart';
// import '../utils/buttons.dart';
// import 'HomePage.dart';
// import 'LoginPage.dart';
//
// class Signup extends StatefulWidget {
//   const Signup({super.key});
//
//   @override
//   State<Signup> createState() => _SignupState();
// }
//
// class _SignupState extends State<Signup> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   bool loading = false;
//   final formkey = GlobalKey<FormState>();
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   Signup() {
//     setState(() {
//       loading = true;
//     });
//     auth
//         .createUserWithEmailAndPassword(
//             email: emailController.text.toString(),
//             password: passwordController.text.toString())
//         .then((value) {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => HomePage()));
//       setState(() {
//         loading = false;
//       });
//     }).onError((error, stackTrace) {
//       Tost().toastMessage(error.toString());
//       setState(() {
//         loading = false;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Sign up'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Form(
//               key: formkey,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: const InputDecoration(
//                         labelText: 'Enter email',
//                         hintText: 'Enter email',
//                         suffixIcon: Icon(Icons.email),
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Enter email address';
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                     TextFormField(
//                         obscureText: true,
//                         controller: passwordController,
//                         keyboardType: TextInputType.visiblePassword,
//                         decoration: const InputDecoration(
//                           labelText: 'Enter password',
//                           hintText: 'Enter password',
//                           suffixIcon: Icon(Icons.password),
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter the password';
//                           } else {
//                             return null;
//                           }
//                         }),
//                     SizedBox(
//                       height: 70,
//                     ),
//                     Button(
//                         text: 'Sign up',
//                         onpressed: () {
//                           if (formkey.currentState!.validate()) {
//                             Signup();
//                           }
//                         }),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Text('Allready have an account'),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Login()));
//                             },
//                             child: Text('Login'))
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resume_builder/Screens/HomePage.dart';
import '../utils/sign_up_services.dart';
import 'LoginPage.dart';
import 'Login_with_phone.dart';
import 'forget_password.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  var nameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.pinkAccent, Colors.purpleAccent])),
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
                    child: Lottie.asset('assets/animations/sign_up_animation.json')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxHeight: 70,
                        minHeight: 40,
                        maxWidth: 400,
                        minWidth: 150),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          hintText: 'Name',
                          labelText: 'Enter Name',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the name';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxHeight: 70,
                      minHeight: 40,
                      maxWidth: 400,
                      minWidth: 150),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: mobileNumberController,
                    decoration: const InputDecoration(
                        hintText: 'Number',
                        labelText: 'Enter mobile number',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the mobile number';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxHeight: 70,
                      minHeight: 40,
                      maxWidth: 400,
                      minWidth: 150),
                  child: TextFormField(
                      controller: emailController,
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
                const SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxHeight: 70,
                      minHeight: 40,
                      maxWidth: 400,
                      minWidth: 150),
                  child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.remove_red_eye),
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: 'Password',
                          labelText: 'Enter password',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the password';
                        } else {
                          return null;
                        }
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => forget_password()));
                      },
                      child: const Text('Forget password',
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
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
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          loading = false;
                        });
                        var userName = nameController.text.trim();
                        var userNumber = mobileNumberController.text.trim();
                        var userEmail = emailController.text.trim();
                        var userPassword = passwordController.text.trim();

                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                            email: userEmail, password: userPassword)

                            .then((value) => {
                          signUpUser(
                            userName,
                            userNumber,
                            userEmail,
                            userPassword,
                          ),
                        })
                            .then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text('Sign up'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Number()));
                            },
                            child: const Text('Login with phone number',
                                style: TextStyle(color: Colors.white))))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => login()));
                  },
                  child: RichText(
                    text: const TextSpan(
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 25),
                        children: [
                          TextSpan(
                              text: 'Already have an account',
                              style: TextStyle(fontSize: 15,color: Colors.black)
                          ),
                          TextSpan(
                              text: ' Login',
                              style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600)
                          ),

                        ]
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
