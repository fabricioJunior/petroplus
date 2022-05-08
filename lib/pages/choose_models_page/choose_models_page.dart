import 'package:flutter/material.dart';

import '../dashboard_page/dashboard_page.dart';

final List<String> inforCliente = ['Perfil', 'Informações', 'Sair'];
get selectedGender => null;

class ChooseModels extends StatelessWidget {
  const ChooseModels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// ------------------------------------------------Logo
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/FundoMiscBG.png'),
            fit: BoxFit.cover,
          ),
        ),

        // Fundo Branco
        child: Center(
          child: Container(
            width: 450,
            height: 600,
            color: const Color.fromARGB(255, 252, 252, 252),
            // Conteudo
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Color.fromRGBO(132, 129, 138, 1),
                      size: 10.09,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 255, 255),
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
                          'Voltar',
                          style: TextStyle(
                            color: Color.fromARGB(255, 77, 77, 77),
                            fontFamily: 'Manrope',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Container(
                      width: 230,
                      child: Image.asset('img/Model3.png'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 255, 255),
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
                          'Model 3',
                          style: TextStyle(
                            color: Color.fromARGB(255, 77, 77, 77),
                            fontFamily: 'Manrope',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

// ------------------------------------------------Entrar
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              'Escolha Modelo/Ano/Kms',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
// ------------------------------------------------Espaço
                    Container(
                      height: 10,
                    ),
// ------------------------------------------------Input
                    Container(
                      width: 280,
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.today,
                                  color: Color.fromRGBO(132, 129, 138, 1),
                                  size: 20.09,
                                ),
                                Container(
                                  width: 20,
                                ),
                                DropdownButton<String>(
                                  icon: Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: Color.fromRGBO(132, 129, 138, 1),
                                    size: 25,
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(inforCliente[0]),
                                      value: inforCliente[0],
                                    ),
                                    DropdownMenuItem(
                                      child: Text(inforCliente[1]),
                                      value: inforCliente[1],
                                    ),
                                    DropdownMenuItem(
                                      child: Text(inforCliente[2]),
                                      value: inforCliente[2],
                                    ),
                                  ],
                                  dropdownColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  onChanged: (value) => setState(
                                    () {
                                      var selectedGender = value;
                                    },
                                  ),
                                  key: selectedGender,
                                  underline: Container(
                                    width: 0,
                                  ),
                                  hint: const Text(
                                    'Versão do Modelo',
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color.fromRGBO(132, 129, 138, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.today,
                                  color: Color.fromRGBO(132, 129, 138, 1),
                                  size: 20.09,
                                ),
                                Container(
                                  width: 20,
                                ),
                                DropdownButton<String>(
                                  icon: Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: Color.fromRGBO(132, 129, 138, 1),
                                    size: 25,
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(inforCliente[0]),
                                      value: inforCliente[0],
                                    ),
                                    DropdownMenuItem(
                                      child: Text(inforCliente[1]),
                                      value: inforCliente[1],
                                    ),
                                    DropdownMenuItem(
                                      child: Text(inforCliente[2]),
                                      value: inforCliente[2],
                                    ),
                                  ],
                                  dropdownColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  onChanged: (value) => setState(
                                    () {
                                      var selectedGender = value;
                                    },
                                  ),
                                  key: selectedGender,
                                  underline: Container(
                                    width: 0,
                                  ),
                                  hint: const Text(
                                    'Ano do Modelo',
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color.fromRGBO(132, 129, 138, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.today,
                                  color: Color.fromRGBO(132, 129, 138, 1),
                                  size: 20.09,
                                ),
                                Container(
                                  width: 20,
                                ),
                                DropdownButton<String>(
                                  icon: Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: Color.fromRGBO(132, 129, 138, 1),
                                    size: 25,
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(inforCliente[0]),
                                      value: inforCliente[0],
                                    ),
                                    DropdownMenuItem(
                                      child: Text(inforCliente[1]),
                                      value: inforCliente[1],
                                    ),
                                    DropdownMenuItem(
                                      child: Text(inforCliente[2]),
                                      value: inforCliente[2],
                                    ),
                                  ],
                                  dropdownColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  onChanged: (value) => setState(
                                    () {
                                      var selectedGender = value;
                                    },
                                  ),
                                  key: selectedGender,
                                  underline: Container(
                                    width: 0,
                                  ),
                                  hint: const Text(
                                    'Kilometragem',
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color.fromRGBO(132, 129, 138, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                            ),

// ------------------------------------------------Forgot/Sing
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 255, 81, 0),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DashboardPage()),
                                    );
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(24, 11, 24, 11),
                                    child: Text(
                                      'Ver Pacotes',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Logo
              ],
            ),
          ),
        ),
      ),
    );
  }

  setState(Null Function() param0) {}
}
