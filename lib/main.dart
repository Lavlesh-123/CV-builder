import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/Splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessaginngBankgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.blue
          ),
      home: const Splash(),
    );
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// import 'package:open_filex/open_filex.dart';
// import 'package:printing/printing.dart';
// import 'package:resume_builder/Screens/Splash.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// void main() {
//   runApp(const MyApp());
// }

// class ResumeController extends GetxController {
//   var name = ''.obs;
//   var email = ''.obs;
//   var phone = ''.obs;
//   var experience = ''.obs;
//   var selectedTemplate = 0.obs;
//   var imagePath = ''.obs;

//   void updateTemplate(int index) {
//     selectedTemplate.value = index;
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Splash(),
//     );
//   }
// }

// class ResumeForm extends StatelessWidget {
//   final ResumeController controller = Get.put(ResumeController());
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final experienceController = TextEditingController();

//   ResumeForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Resume Builder')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(labelText: 'Full Name'),
//               onChanged: (val) => controller.name.value = val,
//             ),
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//               onChanged: (val) => controller.email.value = val,
//             ),
//             TextField(
//               controller: phoneController,
//               decoration: const InputDecoration(labelText: 'Phone'),
//               onChanged: (val) => controller.phone.value = val,
//             ),
//             TextField(
//               controller: experienceController,
//               decoration: const InputDecoration(labelText: 'Experience'),
//               onChanged: (val) => controller.experience.value = val,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => Get.to(TemplateSelection()),
//               child: const Text('Choose Template'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: pickImage,
//               child: const Text('Select Profile Photo'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: (){
//                 generateResume();
//               },
//               child: const Text('Generate PDF'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       controller.imagePath.value = pickedFile.path;
//     }
//   }


// Future<void> generateResume() async {
//   final pdf = pw.Document();

//   // Load an image (Profile Picture)
//   final profileImage = await rootBundle.load('assets/images/lavlesh.jpeg').then((data) => data.buffer.asUint8List());


//   pdf.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             // Header Section
//             pw.Row(
//               children: [
//                 pw.Container(
//                   width: 80,
//                   height: 80,
//                   decoration: pw.BoxDecoration(
//                     shape: pw.BoxShape.circle,
//                     image: pw.DecorationImage(
//                       image: pw.MemoryImage(profileImage),
//                       fit: pw.BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 pw.SizedBox(width: 20),
//                 pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text("Lavlesh Kumar", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
//                     pw.Text("Flutter Developer", style: const pw.TextStyle(fontSize: 18)),
//                     pw.Text("lavleshkumr1234@gmail.com"),
//                     pw.Text("+91 9651495748"),
//                   ],
//                 ),
//               ],
//             ),
//             pw.SizedBox(height: 20),

//             // Experience Section
//             pw.Text("EXPERIENCE", style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 5),
//             pw.Text("12/11/2022 - 12/11/2019"),
//             pw.Text("MendZone | WisiPay"),
//             pw.Text(
//               "Worked as a Flutter Developer, built applications with GetX state management, integrated Firebase for authentication, and designed UI/UX components.",
//               textAlign: pw.TextAlign.justify,
//             ),

//             // Add more sections like Education, Skills, Projects, etc.
//           ],
//         );
//       },
//     ),
//   );

//   // Save PDF to Device
//   final output = await getTemporaryDirectory();
//   final file = File("${output.path}/resume.pdf");
//   await file.writeAsBytes(await pdf.save());

//   // Print Preview
//   await Printing.layoutPdf(
//     onLayout: (PdfPageFormat format) async => pdf.save(),
//   );
// }


//   pw.Widget defaultTemplate(pw.ImageProvider? image) {
//     return pw.Column(
//       children: [
//         if (image != null) pw.Image(image, width: 100, height: 100),
//         pw.Text(controller.name.value,
//             style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
//         pw.Divider(),
//         pw.Text(controller.email.value),
//         pw.Text(controller.phone.value),
//         pw.Text('Experience: ${controller.experience.value}'),
//       ],
//     );
//   }

//   pw.Widget templateOne(pw.ImageProvider? image) {
//     return pw.Container(
//       decoration: const pw.BoxDecoration(color: PdfColors.blue100),
//       padding: const pw.EdgeInsets.all(10),
//       child: pw.Column(
//         children: [
//           if (image != null) pw.Image(image, width: 100, height: 100),
//           pw.Text(controller.name.value,
//               style: pw.TextStyle(
//                   fontSize: 26,
//                   fontWeight: pw.FontWeight.bold,
//                   color: PdfColors.blue800)),
//           pw.SizedBox(height: 5),
//           pw.Text(controller.email.value,
//               style: const pw.TextStyle(color: PdfColors.blue700)),
//           pw.Text(controller.phone.value,
//               style: const pw.TextStyle(color: PdfColors.blue700)),
//           pw.SizedBox(height: 10),
//           pw.Text('Experience: ${controller.experience.value}',
//               style: const pw.TextStyle(fontSize: 18)),
//         ],
//       ),
//     );
//   }

//   pw.Widget templateTwo(pw.ImageProvider? image) {
//     return pw.Container(
//       decoration: const pw.BoxDecoration(color: PdfColors.green100),
//       padding: const pw.EdgeInsets.all(10),
//       child: pw.Column(
//         children: [
//           if (image != null) pw.Image(image, width: 100, height: 100),
//           pw.Text(controller.name.value,
//               style: pw.TextStyle(
//                   fontSize: 26,
//                   fontWeight: pw.FontWeight.bold,
//                   color: PdfColors.green800)),
//           pw.SizedBox(height: 5),
//           pw.Text(controller.email.value,
//               style: const pw.TextStyle(color: PdfColors.green700)),
//           pw.Text(controller.phone.value,
//               style: const pw.TextStyle(color: PdfColors.green700)),
//           pw.SizedBox(height: 10),
//           pw.Text('Experience: ${controller.experience.value}',
//               style: const pw.TextStyle(fontSize: 18)),
//         ],
//       ),
//     );
//   }
// }

// class TemplateSelection extends StatelessWidget {
//   final ResumeController controller = Get.find();

//   TemplateSelection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Template')),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(10),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 2,
//         ),
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               controller.updateTemplate(index);
//               Get.back();
//             },
//             child: Card(
//               color: controller.selectedTemplate.value == index
//                   ? Colors.blueAccent
//                   : Colors.white,
//               child: Center(
//                 child: Text('Template ${index + 1}',
//                     style: const TextStyle(fontSize: 18)),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//         apiKey: "AIzaSyDOEmjSo2vt-2YV6R2rfu5qU93XUqre9V4",
//         appId: "1:234812635665:android:138f16c258c935c4d14fb0",
//         messagingSenderId: '234812635665',
//         projectId: "wtask-fe7cb",
//       ),
//     );
//   } catch (e) {
//     log("Error initializing Firebase: $e");
//   }
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const AdminPanel(),
//     );
//   }
// }

// // class MainPage extends StatelessWidget {
// //   const MainPage({super.key});

// //   @override
// //   Widget build(BuildContext context) => Scaffold(
// //         body: StreamBuilder(
// //           stream: FirebaseAuth.instance.authStateChanges(),
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return const Center(
// //                 child: SpinKitFadingCircle(
// //                   color: Colors.blue, // Set the color of the spinner
// //                   size: 50.0,
// //                 ),
// //               );
// //             } else if (snapshot.hasData) {
// //               Logger.success('auth stream has data');
// //               return FutureBuilder(
// //                 future: isUserExist(),
// //                 builder: (context, snapshot) {
// //                   if (snapshot.hasData) {
// //                     Logger.success('User Exists');
// //                     return HomeScreen();
// //                   } else {
// //                     return const Center(
// //                         child: SpinKitDoubleBounce(
// //                       color: Colors.blue, // Set the color of the spinner
// //                       size: 50.0,
// //                     ));
// //                   }
// //                 },
// //               );
// //             } else if (snapshot.hasError) {
// //               return const Center(
// //                 child: Text('Something went wrong!!'),
// //               );
// //             } else {
// //               return LoginScreen();
// //             }
// //           },
// //         ),
// //       );

// //   Future<bool> isUserExist() async {
// //     String userUID = FirebaseAuth.instance.currentUser!.uid;
// //     var docSnapshot = await FirebaseFirestore.instance.collection('Production').doc(userUID).get();
// //     Logger.info(userUID);

// //     return docSnapshot.exists;
// //   }
// // }

// class UserScreen extends StatelessWidget {
//   final TextEditingController _textEditingController = TextEditingController();

//   UserScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('User Screen')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(controller: _textEditingController),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 String text = _textEditingController.text;
//                 // Store text in Firestore under a collection named 'user_data'
//                 FirebaseFirestore.instance
//                     .collection('user_data')
//                     .add({'text': text});
//                 // _textEditingController.clear(); // Clear the text field after submission
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                     content: Text('Data submitted successfully')));
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class AdminPanel extends StatelessWidget {
//   const AdminPanel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Admin Panel')),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('user_data').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           return ListView(
//             children: snapshot.data!.docs.map((doc) {
//               String text = doc['text'];
//               String documentId = doc.id;
//               return ListTile(
//                 title: Text(text),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => EditScreen(initialText: text, documentId: documentId),
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }

// class EditScreen extends StatefulWidget {
//   final String initialText;
//   final String documentId;

//   const EditScreen({super.key, required this.initialText, required this.documentId});

//   @override
//   _EditScreenState createState() => _EditScreenState();
// }

// class _EditScreenState extends State<EditScreen> {
//   late TextEditingController _textEditingController;

//   @override
//   void initState() {
//     super.initState();
//     _textEditingController = TextEditingController(text: widget.initialText);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Edit Screen')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(controller: _textEditingController),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 String newText = _textEditingController.text;
//                 // Update text in Firestore
//                 FirebaseFirestore.instance.collection('user_data').doc(widget.documentId).update({'text': newText});
//                 // Go back to AdminPanel
//                 Navigator.pop(context);
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }
// }

