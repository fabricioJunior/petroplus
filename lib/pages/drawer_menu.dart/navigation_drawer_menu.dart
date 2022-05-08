import 'package:flutter/material.dart';

import '../dashboard_page/dashboard_page.dart';
import '../delivery_audit/delivery_audit_page.dart';
import '../index.dart';
import '../model_vehicle/model_vehicle_page.dart';
import '../reception_checklists/reception_checklist_page.dart';

final List<String> inforCliente = ['Editar Perfil', 'Sair'];
get selectedGender => null;

class NavigationDrawerPagina extends StatelessWidget {
  const NavigationDrawerPagina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(46, 44, 52, 1),
        child: ListView(
          children: <Widget>[
            Container(
              height: 30,
            ),
            Image.asset(
              'assets/img/logobrancamenos.png',
              fit: BoxFit.contain,
              height: 38,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromARGB(255, 255, 102, 0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.work,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 20.09,
                        ),
                        Container(
                          width: 10,
                        ),
                        DropdownButton<String>(
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 25,
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Column(
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(0, 0, 190, 41),
                                    ),
                                    onPressed: () {},
                                    // onPressed: () {
                                    //   Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //       builder: (context) => HomeSplash(),
                                    //     ),
                                    //   );
                                    // },
                                    child: Text(
                                      inforCliente[0],
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              value: inforCliente[0],
                            ),
                            DropdownMenuItem(
                              child: Column(
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(0, 0, 190, 41),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => HomeSplash(),
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text("Deslogado com sucesso!"),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      inforCliente[1],
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              value: inforCliente[1],
                            ),
                          ],
                          dropdownColor: Color.fromARGB(255, 255, 255, 255),
                          onChanged: (value) => setState(
                            () {
                              var selectedGender = value;
                            },
                          ),
                          key: selectedGender,
                          underline: Container(
                            height: 0,
                          ),
                          hint: const Text(
                            'Leandro F. [Consultor]',
                            style: TextStyle(
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  buildMenuItem(
                    text: "Checklists de Recepção",
                    icon: Icons.grading,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  buildMenuItem(
                    text: "Pacotes de Revisão",
                    icon: Icons.request_quote,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  buildMenuItem(
                    text: "Auditoria de Entrega",
                    icon: Icons.find_in_page,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  buildMenuItem(
                    text: "Atualizar Dados",
                    icon: Icons.autorenew_outlined,
                    onClicked: () => selectedItem(context, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: TextStyle(
            color: color,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.normal,
            fontSize: 15,
          )),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ReceptionChecklist(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ModelVehicle(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DeliveryAuditPage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DashboardPage(),
        ));
        break;
    }
  }

  setState(Null Function() param0) {}
}
