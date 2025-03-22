// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../utils/Tost.dart';
// import '../utils/buttons.dart';
// import 'HomePage.dart';
// import 'SignupPage.dart';
//
// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final formkey = GlobalKey<FormState>();
//   bool loading = false;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   Login() {
//     setState(() {
//       loading = true;
//     });
//     auth
//         .signInWithEmailAndPassword(
//             email: emailController.text.toString(),
//             password: passwordController.text.toString())
//         .then((value) {
//       Tost().toastMessage(value.user!.email.toString());
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
//         title: Text('Login'),
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
//                       decoration: InputDecoration(
//                           hintText: 'email',
//                           border: OutlineInputBorder(),
//                           suffixIcon: Icon(Icons.email)),
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
//                           hintText: 'password',
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
//                         text: 'Login',
//                         onpressed: () {
//                           if (formkey.currentState!.validate()) {
//                             Login();
//                           }
//                         }),
//
//
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

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resume_builder/Screens/HomePage.dart';

import 'Login_with_phone.dart';
import 'SignupPage.dart';
import 'Splash.dart';
import 'forget_password.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.purpleAccent,Colors.blue]
            )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    width: mq.size.width * 0.7,
                    height: mq.size.height * 0.5,
                    child: Lottie.asset('assets/animations/animation_lm5og2s1.json'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxHeight: 70, minHeight: 40, maxWidth: 400, minWidth: 150),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          labelText: 'Enter email',
                          suffixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter the email';
                        }else{
                          return null;
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 10,),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxHeight: 70, minHeight: 40, maxWidth: 400, minWidth: 150),

                    child: TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          suffix: Icon(Icons.remove_red_eye),
                          prefix: Icon(Icons.lock_outline),
                          hintText: 'Password',
                          labelText: 'Enter password',
                          border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter the password';
                        }else{
                          return null;
                        }
                      },
                    ),

                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const forget_password()));
                          },
                          child: const Text('Forget password',style: TextStyle(color:Colors.white))),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxHeight: 50, minHeight: 30, maxWidth: 300, minWidth: 250),
                    child: InkWell(
                      onTap: (){
                        if(formkey.currentState!.validate()){
                          login();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child:const Center(
                          child: Text('Login'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const Number() ));
                      }, child: const Text('Login with phone number',style: TextStyle(color:Colors.white)))
                    ],
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Sign_up()));
                    },
                    child: RichText(
                      text: const TextSpan(
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 25),
                          children: [
                            TextSpan(
                                text: 'Don\'t have an account',
                                style: TextStyle(fontSize: 15,color: Colors.black)
                            ),
                            TextSpan(
                                text: ' Sing up',
                                style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600)
                            ),

                          ]
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    auth.
    signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }
}
