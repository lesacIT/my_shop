// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:my_shop/pages/signup.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = new GoogleSignIn();
//   final _formKey = GlobalKey<FormState>();

//   TextEditingController _emailTextController = new TextEditingController();
//   TextEditingController _passwordTextController = new TextEditingController();
//   late SharedPreferences preferences;
//   bool loading = false;
//   bool isLogedin = false;

//   @override
//   void initState() {
//     super.initState();
//     isSignedIn();
//   }

//   void isSignedIn() async {
//     setState(() {
//       loading = true;
//     });

//     isLogedin = await googleSignIn.isSignedIn();

//     // if (isLogedin) {
//     //   Navigator.pushReplacement(
//     //       context, MaterialPageRoute(builder: (context) => Login()));
//     // }

//     setState(() {
//       loading = false;
//     });
//   }

//   // Future handleSignedIn() async {
//   //   preferences = await SharedPreferences.getInstance();
//   //   setState(() {
//   //     loading = true;
//   //   });
//   //   GoogleSignInAccount? googleuser = await googleSignIn.signIn();
//   //   GoogleSignInAuthentication? googleSignInAuthentication =
//   //       await googleuser?.authentication;
//   //   final AuthCredential credential = GoogleAuthProvider.credential(
//   //     accessToken: googleSignInAuthentication?.accessToken,
//   //     idToken: googleSignInAuthentication?.idToken,
//   //   );
//   //   final UserCredential authresult =
//   //       await firebaseAuth.signInWithCredential(credential);
//   //   final User? user = authresult.user;

//   //   if (user != null) {
//   //     final QuerySnapshot result = await FirebaseFirestore.instance
//   //         .collection('users')
//   //         .where('id', isEqualTo: user.uid)
//   //         .get();
//   //     final List<DocumentSnapshot> documents = result.docs;
//   //     if (documents.length == 0) {
//   //       FirebaseFirestore.instance.collection('users').doc(user.uid).set({
//   //         "id": user.uid,
//   //         "username": user.displayName,
//   //         "profilepicture": user.photoURL,
//   //       });
//   //       await preferences.setString("id", user.uid ?? "");
//   //       await preferences.setString("username", user.displayName ?? "");
//   //       await preferences.setString("photoUrl", user.photoURL ?? "");
//   //     } else {
//   //       await preferences.setString("id", documents[0]['id']);
//   //       await preferences.setString("username", documents[0]['username']);
//   //       await preferences.setString("photoUrl", documents[0]['photoURL']);
//   //     }
//   //     Fluttertoast.showToast(msg: "Logged in successfuly");
//   //     setState(() {
//   //       loading = false;
//   //     });
//   //     Navigator.pushReplacement(
//   //         context, MaterialPageRoute(builder: (context) => HomePage()));
//   //   } else {
//   //     Fluttertoast.showToast(msg: "Login failed :(");
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Image.asset(
//             'images/back.jpg',
//             fit: BoxFit.fill,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           Container(
//             color: Colors.black.withOpacity(0.4),
//             width: double.infinity,
//             height: double.infinity,
//             alignment: Alignment.topCenter,
//             child: Image.asset(
//               "images/logo.png",
//               width: 280.0,
//               height: 280.0,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 200.0),
//             child: Center(
//               child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding:
//                             const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
//                         child: Material(
//                           borderRadius: BorderRadius.circular(10.0),
//                           color: Colors.white.withOpacity(0.8),
//                           elevation: 0.0,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 12.0),
//                             child: TextFormField(
//                               controller: _emailTextController,
//                               decoration: InputDecoration(
//                                 hintText: "Email",
//                                 icon: Icon(Icons.alternate_email),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your email address';
//                                 } else {
//                                   final pattern =
//                                       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                                   final regex = RegExp(pattern);
//                                   if (!regex.hasMatch(value)) {
//                                     return 'Please make sure your email address is valid';
//                                   } else {
//                                     return null;
//                                   }
//                                 }
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
//                         child: Material(
//                           borderRadius: BorderRadius.circular(10.0),
//                           color: Colors.white.withOpacity(0.8),
//                           elevation: 0.0,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 12.0),
//                             child: TextFormField(
//                               controller: _passwordTextController,
//                               decoration: InputDecoration(
//                                 hintText: "Password",
//                                 icon: Icon(Icons.lock_outline),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "The password field cannot be empty";
//                                 } else if (value.length < 6) {
//                                   return "The password has to be at least 6 characters long";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20.0),
//                           color: Colors.blue,
//                           elevation: 0.0,
//                           child: MaterialButton(
//                             onPressed: () {},
//                             minWidth: MediaQuery.of(context).size.width,
//                             child: Text(
//                               "Login",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 22.0),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           "Forgot password",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => SignUp()));
//                               },
//                               child: Text(
//                                 "Sign up",
//                                 style: TextStyle(color: Colors.red),
//                               ))),
//                     ],
//                   )),
//             ),
//           ),
//           Visibility(
//             visible: loading ?? true,
//             child: Center(
//               child: Container(
//                 alignment: Alignment.center,
//                 color: Colors.white.withOpacity(0.9),
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
