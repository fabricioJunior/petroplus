import 'package:flutter/material.dart';

import '../dashboard_page/dashboard_page.dart';

class NavigationDrawerMenu extends StatelessWidget {
  const NavigationDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'X'),
                child: const Text(
                  'X',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets//img/Model3.png"),
              // --------------------------Informações do Cliente
              Form(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Text(
                        "Informações do Cliente",
                        style: TextStyle(
                          color: Color.fromARGB(204, 0, 0, 0),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      Container(height: 15),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _emailImputController,
                        //onSaved: (email) => _authData['email'] = email ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Nome Completo',
                          labelStyle: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 81, 0),
                            ),
                          ),
                        ),
                      ),

                      Container(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _emailImputController,
                        //onSaved: (email) => _authData['email'] = email ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Celular',
                          labelStyle: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 81, 0),
                            ),
                          ),
                        ),
                      ),

                      Container(height: 10),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _emailImputController,
                        //onSaved: (email) => _authData['email'] = email ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'E-Mail',
                          labelStyle: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 81, 0),
                            ),
                          ),
                        ),
                      ),
                      // --------------------------Informações do Veiculo
                      Container(height: 25),
                      Text(
                        "Informações do Veículo",
                        style: TextStyle(
                          color: Color.fromARGB(204, 0, 0, 0),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),

                      Container(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _emailImputController,
                        //onSaved: (email) => _authData['email'] = email ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Modelo',
                          labelStyle: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 81, 0),
                            ),
                          ),
                        ),
                      ),
                      Container(height: 10),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _emailImputController,
                        //onSaved: (email) => _authData['email'] = email ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Versão / Ano',
                          labelStyle: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 81, 0),
                            ),
                          ),
                        ),
                      ),
                      Container(height: 10),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _emailImputController,
                        //onSaved: (email) => _authData['email'] = email ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Cor',
                          labelStyle: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 81, 0),
                            ),
                          ),
                        ),
                      ),
                      Container(height: 10),

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _emailImputController,
                        //onSaved: (email) => _authData['email'] = email ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Kilometragem',
                          labelStyle: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 81, 0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 81, 0),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardPage()),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(24, 11, 24, 11),
                            child: Text(
                              'Iniciar Orçamento',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 233, 233, 233),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardPage()),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(24, 11, 24, 11),
                            child: Text(
                              'VIisualizar Inspeção',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 81, 0),
                                fontFamily: 'Manrope',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () => Navigator.pop(context, 'Iniciar Orçamento'),
                      //   child: const Text('Iniciar Orçamento'),
                      // ),
                      // TextButton(
                      //   onPressed: () => Navigator.pop(context, 'Iniciar Orçamento'),
                      //   child: const Text('Iniciar Orçamento'),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class TabelaInformacaoClienteVeiculo extends StatelessWidget {
//   TabelaInformacaoClienteVeiculo(
//       {Key? key, required this.chamadaTabelaInformacao})
//       : super(key: key);

//   String? chamadaTabelaInformacao;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "$chamadaTabelaInformacao",
//           style: TextStyle(
//             color: Color.fromARGB(204, 0, 0, 0),
//             fontFamily: 'Manrope',
//             fontWeight: FontWeight.normal,
//             fontSize: 10,
//           ),
//         ),
//       ],
//     );
//   }
// }
