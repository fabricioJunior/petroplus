import 'package:flutter/material.dart';
import '../../pages/delivery_audit/delivery_audit_page.dart';
import '../../pages/finalize_budget_page/finalize_budget_page.dart';
import '../../pages/index.dart';
import '../../pages/model_vehicle/model_vehicle_page.dart';
import '../../pages/service_menu_page/service_menu_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  // ignore: must_call_super
  void initState() {
    var d = Duration(seconds: 3);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            // return FinalizeBudgetPage();
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