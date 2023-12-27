import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsit_read/screens/login_page/login_model.dart';
import 'package:newsit_read/screens/signup_page/signup_bloc.dart';
import 'package:newsit_read/screens/signup_page/signup_event.dart';
import 'package:newsit_read/utils/preference_helpher.dart';

import '../../base/base_state.dart';
import '../../router.dart';
import '../../utils/color_resources.dart';
import '../../utils/contants.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpBloc bloc;
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();
  bool valuefirst = false;
  TextEditingController mobileController = TextEditingController();


  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<SignUpBloc>(context);

  }

  loginUser(SignUpBloc bloc) async {
    final Map<String, dynamic> data = {
      "MobileNumber": mobileController.text,
      "isWhatsapp": valuefirst,
      "CountryCode": "+91"
    };

      bloc.add(LoginUserEvent(context: context, arguments: data));
    if (kDebugMode) {
      print('-------- $data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {
      if (state is SuccessState) {
        if (state.successResponse is String) {
          setState(() {});
        } else if (state.successResponse is LoginResponseData) {
          final LoginResponseData responseModel = state.successResponse;
          if (responseModel.status == Constants.success) {
            PreferenceHelper.setBearer(responseModel.bearer);

          }
        }
      }
      },
      child: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, BaseState state) {
            if (state is InitialState) {
              return const  Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SuccessState) {


            }
            return  SafeArea(
              child: Scaffold(
                appBar: AppBar(
                    backgroundColor: ColorResource.colorE02E23,
                    // centerTitle: true,
                    title: const Text("Login Page",
                      style: TextStyle(color: Colors.white),
                    )),
                body:  DraggableScrollableSheet(

                  key: _sheet,
                  initialChildSize: 0.6,
                  maxChildSize: 1,
                  minChildSize: 0,
                  expand: true,
                  snap: true,
                  snapSizes: const [0.6],
                  controller: _controller,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return DecoratedBox(
                      decoration:  BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius:  const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child:
                        Padding(
                          padding:  EdgeInsets.all(18.0),
                          child: CustomScrollView(
                            controller: scrollController,
                            slivers:   [
                              SliverToBoxAdapter(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10,),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Get Started !',
                                        style:  TextStyle(
                                          fontSize: 20,
                                          color: Colors.black
                                        ),
                                        ),

                                      ],
                                    ),

                                    SizedBox(height: 15,),

                                     TextFormField(
                                       keyboardType: TextInputType.number,
                                        controller: mobileController,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white70,
                                        enabledBorder: OutlineInputBorder(

                                          borderSide: BorderSide(color: Colors.white70,),
                                        ),

                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                        ),
                                        labelText: 'Enter Mobile Number',


                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.greenAccent,
                                          activeColor: Colors.red,
                                          value: valuefirst,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.valuefirst = value!;
                                            });
                                          },
                                        ),
                                        Text('Receive code via Whatsapp')
                                      ],
                                    ),

                                    InkWell(
                                      onTap: () {
                                        loginUser(bloc);
                                              Navigator.pushNamed(
                                                  context, AppRoutes.otpScreen);
                                      },
                                      child: Container(
                                        height: 50,
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: ColorResource.colorE22C24,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10.0)),
                                        ),
                                        child: const Text(
                                          "Get OTP",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: ColorResource.colorFFFFFF,
                                              fontFamily: 'DMSans-Medium'),
                                        ),
                                      ),
                                    ),

                                    // ElevatedButton(
                                    //     onPressed: () {
                                    //
                                    //       Navigator.pushReplacementNamed(
                                    //           context, AppRoutes.otpScreen);
                                    //
                                    //     },
                                    //     style: ElevatedButton.styleFrom(fixedSize: const Size(300, 50)),
                                    //     child: const Text(' GET OTP ')),

                                    SizedBox(height:8,),

                                    const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('or Continue with')
                                      ],
                                    ),

                                    SizedBox(height: 20,),

                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/png/google.png'),
                                          width: 40,
                                          height: 40,
                                        ),
                                        SizedBox(width: 20,),
                                        Image(
                                          image: AssetImage(
                                              'assets/png/facebook.png'),
                                          width: 40,
                                          height: 40,
                                        ),
                                      ],
                                    )

                                  ],
                                )

                                // TextField(
                                //   // controller: _textEditingController,
                                //   decoration: InputDecoration(
                                //     labelText: 'Enter Text',
                                //     border: OutlineInputBorder(),
                                //   ),
                                // ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )

                // Center(
                //   child: SizedBox.expand(
                //     child: DraggableScrollableSheet(
                //       builder: (BuildContext context,
                //           ScrollController scrollController) {
                //         return Padding(
                //           padding: MediaQuery.of(context).viewInsets,
                //           child: Stack(
                //             children: [
                //               Container(
                //                 child: const Card(
                //                   margin: EdgeInsets.zero,
                //                   shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.only(topRight: Radius.circular(12),
                //                     topLeft: Radius.circular(12)
                //                     )
                //                   ),
                //                   color: Colors.white,
                //
                //                 ),
                //               )
                //             ],
                //           ),
                //         );
                //       },
                //
                //     ),
                //
                //   ),
                // )

              ),
            );
          }),
    );
  }
}
