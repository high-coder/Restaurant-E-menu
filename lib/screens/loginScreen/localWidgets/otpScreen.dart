import 'package:final_wala_final_pka/screens/loginScreen/provider/loginProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginProvider instanceP = Provider.of<LoginProvider>(context, listen:false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 100,),
          Container(
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(10),
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.fromLTRB(20, 0, 0, 0),
                  hintText: 'Enter Otp',
                  //enabledBorder: InputBorder.none,
                  //focusedBorder: InputBorder.none,
                  helperText: " ",
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                ),
                controller: _otpController,
                onChanged: (input) {

                },
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              instanceP.verifyOtp(_otpController.text, context);
            },
          )
        ],
      ),
    );
  }
}
