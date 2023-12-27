import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsit_read/utils/fonts.dart';

import '../../base/base_state.dart';
import '../../router.dart';
import '../../utils/color_resources.dart';
import '../localization/locale_constant.dart';
import '../localization/model/lang_model_data.dart';
import 'login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc bloc;

  TextEditingController nameController = TextEditingController();
  bool isGetStarted = false;
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  int? selectedOption;


  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);
    if(nameController.text.isNotEmpty) {
      isGetStarted = true;
    }
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
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Row(
                          children: [
                            Text('Welcome !',
                            style: TextStyle(
                              fontSize: 24,
                              color: ColorResource.color333333,
                              fontFamily: 'DMSans-Bold'
                            ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('How can we call you?',
                            style: TextStyle(
                                fontSize: 14,
                                color: ColorResource.color333333,
                                fontFamily: 'DMSans-Light'
                            ),
                          )],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            TextFormField(
                              controller: nameController,


                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:  BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),

                                prefixIcon: Icon(Icons.person_pin),

                                hintText: 'Enter your name',
                                hintStyle: TextStyle(
                                    fontFamily: 'DMSans-Light',
                                   color:  Colors.grey,
                                )
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  if(value!.isNotEmpty) {
                                    isGetStarted = true;
                                  } else {
                                    isGetStarted = false;
                                  }
                                });
                              },

                            )
                          ],
                        ),
                        const SizedBox(height: 15,),
                        const Column(
                          children: [
                            Text(' Select Language',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'DMSans-Light'
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              title: const Text('English'),
                              leading: Radio(
                                value: 1,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value;

                                  });
                                }
                                // onChanged: ( LanguageData? language) {
                                //   setState(() {
                                //     // selectedOption = value;
                                //     changeLanguage(context, language!.languageCode);
                                //     // isGetStarted =
                                //   });
                                // },
                              ),
                            ),

                            ListTile(
                              title: const Text('தமிழ்'),
                              leading: Radio(
                                value: 2,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value;
                                    print("Button value: $value");
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       // color: Colors.red,
                        //       height:150,
                        //       width: 150,
                        //     ),
                        //     Container(
                        //       // color: Colors.green,
                        //       height: 150,
                        //       width: 150,
                        //     ),
                        //   ],
                        // ),
                        Expanded(
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, AppRoutes.signUpScreen);
                                  },
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    decoration:  BoxDecoration(
                                      color: isGetStarted ? ColorResource.colorE22C24  : Colors.grey,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    child: const Text(
                                      "Get Started",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorResource.colorFFFFFF,
                                          fontFamily: 'DMSans-Medium'),
                                    ),
                                  ),
                                )))
                      ]),
                ),
              ),
            );
          }),
    );
  }
}
