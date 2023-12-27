import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../base/base_state.dart';
import '../../router.dart';
import '../../utils/color_resources.dart';
import 'otp_bloc.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late OTPBloc bloc;
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();
  OtpFieldController otpController = OtpFieldController();


  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<OTPBloc>(context);
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
            } else if (state is SuccessState) {}
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                    backgroundColor: ColorResource.colorE02E23,
                    // centerTitle: true,
                    title: const Text(
                      "OTP Page",
                      style: TextStyle(color: Colors.white),
                    )),
                body: DraggableScrollableSheet(
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
         decoration: BoxDecoration(
           color: Colors.grey[200],
           borderRadius:  const BorderRadius.only(
             topLeft: Radius.circular(30),
             topRight: Radius.circular(30),
           ),

         ),
         child: Center(
           child: Padding(padding: EdgeInsets.all(18),
           child: CustomScrollView(
             controller: scrollController,
             slivers:  [
               SliverToBoxAdapter(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Verify OTP',
                           style:  TextStyle(
                               fontSize: 20,
                               color: Colors.black
                           ),
                         ),

                       ],
                     ),
                     SizedBox(height: 10,),
                     const Column(
                       // crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('OTP has been sent to')
                       ],
                     ),
                     SizedBox( height: 40,),
                     Column(
                       children: [
                     Center(
                     child: OTPTextField(
                     controller: otpController,
                         length: 4,
                         width: MediaQuery.of(context).size.width,
                         textFieldAlignment: MainAxisAlignment.spaceAround,
                         fieldWidth: 45,
                         fieldStyle: FieldStyle.box,
                         outlineBorderRadius: 10,
                         style: TextStyle(fontSize: 17),
                         onChanged: (pin) {
                           print("Changed: " + pin);
                         },
                         onCompleted: (pin) {
                           print("Completed: " + pin);
                         }),
         ),
         ]
       ),
                      SizedBox(height: 40,),
                      Column(
                        children: [
                          Center(
                            child: Text('Resend OTP'),
                          )
                        ],
                      ),


                     SizedBox( height: 30,),

                     Column(
                       children: [
                         InkWell(
                           onTap: () {
                             Navigator.pushReplacementNamed(
                                 context, AppRoutes.locationScreen);
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
                               "Verify OTP",
                               style: TextStyle(
                                   fontSize: 16,
                                   color: ColorResource.colorFFFFFF,
                                   fontFamily: 'DMSans-Medium'),
                             ),
                           ),
                         ),

                       ],
                     )


                   ],
                 ),
               )
             ],
           ),
           ),
         ),
       );
    }

                )
              ),
            );
          }),
    );
  }
}
