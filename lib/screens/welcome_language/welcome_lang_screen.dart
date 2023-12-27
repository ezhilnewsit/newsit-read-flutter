

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import 'welcome_lang_bloc.dart';

class WelcomeLangScreen extends StatefulWidget {
  const WelcomeLangScreen({Key? key}) : super(key: key);

  @override
  _WelcomeLangScreenState createState() => _WelcomeLangScreenState();
}

class _WelcomeLangScreenState extends State<WelcomeLangScreen> {
  late WelcomeLangBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<WelcomeLangBloc>(context);

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
                  child:
                  Column(

                    children: [
                      Container(
                        padding: EdgeInsets.all(50),
                        child: Text('NEWSIT - READ', style: TextStyle(fontSize: 25, color: Colors.black),),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}