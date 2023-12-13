import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import 'login_bloc.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc bloc;
   
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoggedIn = false;
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);


  }



  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {},
      child: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, BaseState state) {
            if (state is InitialState) {
              return const Center(
                child: Text('New DAT888888888888888888888A'),
              );
            } else if (state is SuccessState) {

            }
            return  SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: ColorResource.colorE02E23,
                  // centerTitle: true,
                    title: Text("Login Page",
                    style: TextStyle(color: Colors.white),
                    )),
                body:
                Center(
                  child: Column(

                    children: [
                      Container(
                        padding: EdgeInsets.all(50),
                        child: Text('NEWSIT - READ', style: TextStyle(fontSize: 25, color: Colors.black),),
                      ),
                      Container(
                        child: _isLoggedIn
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(_userObj!.photoUrl.toString()),
                            Text(_userObj!.displayName.toString()),
                            Text(_userObj!.email),
                            TextButton(
                                onPressed: () {
                                  _googleSignIn.signOut().then((value) {
                                    setState(() {
                                      _isLoggedIn = false;
                                    });
                                  }).catchError((e) {});
                                },
                                child: Text("Logout"))
                          ],
                        )
                            : Center(
                          child: ElevatedButton(
                            child: Text("Login with Google"),
                            onPressed: () {
                              _googleSignIn.signIn().then((userData) {
                                setState(() {
                                  _isLoggedIn = true;
                                  _userObj = userData!;
                                });
                              }).catchError((e) {
                                print(e);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );

        //       Scaffold(
        //       body:  Padding(
        // padding:  const EdgeInsets.all(10),
        // child:

        // ListView(
        //   children: <Widget>[
        //     Container(
        //         alignment: Alignment.center,
        //         padding: const EdgeInsets.all(10),
        //         child: const Text(
        //           'Sign in',
        //           style: TextStyle(fontSize: 20),
        //         )),
        //     Container(
        //       padding: const EdgeInsets.all(10),
        //       child: TextField(
        //         controller: nameController,
        //         decoration: const InputDecoration(
        //           border: OutlineInputBorder(),
        //           labelText: 'User Name',
        //         ),
        //       ),
        //     ),
        //     Container(
        //       padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        //       child: TextField(
        //         obscureText: true,
        //         controller: passwordController,
        //         decoration: const InputDecoration(
        //           border: OutlineInputBorder(),
        //           labelText: 'Password',
        //         ),
        //       ),
        //     ),
        //     TextButton(
        //       onPressed: () {
        //         //forgot password screen
        //       },
        //       child: const Text('Forgot Password',),
        //     ),
        //     Container(
        //         height: 50,
        //         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        //         child: ElevatedButton(
        //           child: const Text('Login'),
        //           onPressed: () {
        //             print(nameController.text);
        //             print(passwordController.text);
        //           },
        //         )
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         const Text('Does not have account?'),
        //         TextButton(
        //           child: const Text(
        //             'Sign in',
        //             style: TextStyle(fontSize: 20),
        //           ),
        //           onPressed: () {
        //             //signup screen
        //           },
        //         )
        //       ],
        //     ),
        //     SizedBox(height: 50,),
        //     Container(
        //       height: 50,
        //       decoration: BoxDecoration(
        //         border: Border.all(
        //             color: HexColor("#E2E2E2"),
        //             width: 1),
        //         borderRadius:
        //         BorderRadius.circular(16),
        //       ),
        //       child: InkWell(
        //         onTap: () {
        //
        //
        //         },
        //         child: Row(
        //           children: [
        //             Expanded(
        //                 flex: 0,
        //                 child: Container(
        //                   margin:
        //                   const EdgeInsets.only(
        //                       left: 16.0,
        //                       right: 16),
        //                   child: Image(
        //                     image: AssetImage(
        //                         'assets/png/google.png'),
        //                     width: 18,
        //                     height: 18,
        //                   ),
        //                 )),
        //             Expanded(
        //               flex: 0,
        //               child: Container(
        //                 width: 1,
        //                 height: 24,
        //                 // color: HexColor("#E2E2E2"),
        //               ),
        //             ),
        //             Expanded(
        //               flex: 1,
        //               child: Container(
        //                 child: Center(
        //                     child: Text(
        //                       'Google',
        //                       style: TextStyle(
        //                           fontSize: 14,
        //                           color:
        //                           HexColor("#717171"),
        //                           fontWeight:
        //                           FontWeight.w500),
        //                     )),
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // )
        //       )
        //     );
          }),
    );
  }
}
