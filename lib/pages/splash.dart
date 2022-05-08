import 'package:flutter/material.dart';
import '../../pages/index.dart';

class Splach extends StatefulWidget {
  const Splach({Key? key}) : super(key: key);

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  // ignore: must_call_super
  void initState() {
    var d = Duration(seconds: 3);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            //return VehicleDataFalse();
            return HomeSplash();
          },
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 255, 103, 1),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 800,
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/logofundobranco.png',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





// Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       child: Image.asset(
//                         'assets/img/logofundobranco.png',
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       child: Image.asset(
//                         'assets/img/logofundobranco.png',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),