


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../router.dart';
import '../../utils/color_resources.dart';
import 'location_bloc.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late LocationBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LocationBloc>(context);

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
            return   SafeArea(
              child: Scaffold(
                body: Center(
                  child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text('Hi Newsit Reader,', style: TextStyle(fontSize: 25, color: Colors.black),),
                          ],
                        ),
                        const Row(
                          children: [
                            Text( 'Choose your preferred location. Well')
                          ],
                        ),
                        SizedBox(height: 30,),
                        Column(
                          children: [
                            TextField(

                              // controller: _textEditingController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                                filled: true,
                                fillColor: Colors.grey[70],
                                enabledBorder: OutlineInputBorder(

                                  borderSide: BorderSide(color:Colors.grey,),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                ),
                                labelText: 'Enter your hometown',


                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),

                        Column(
                          children: [
                            TextField(

                              // controller: _textEditingController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                                filled: true,
                                fillColor: Colors.grey[70],
                                enabledBorder: OutlineInputBorder(

                                  borderSide: BorderSide(color:Colors.grey,),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                ),
                                labelText: 'Enter your city',


                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10,),

                        Column(
                          children: [
                            TextField(

                              // controller: _textEditingController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                                filled: true,
                                fillColor: Colors.grey[70],
                                enabledBorder: OutlineInputBorder(

                                  borderSide: BorderSide(color:Colors.grey,),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                ),
                                labelText: 'Select cities of your choice',


                              ),
                            ),
                          ],
                        ),

                        Expanded(
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(context, AppRoutes.signUpScreen);
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
                                      "Continue",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorResource.colorFFFFFF,
                                          fontFamily: 'DMSans-Medium'),
                                    ),
                                  ),
                                )))

                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}