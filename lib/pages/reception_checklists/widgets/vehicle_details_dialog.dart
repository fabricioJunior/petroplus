import 'package:flutter/material.dart';

class VehicleDetailsDialog extends StatelessWidget {
  final bool isTablet;
  final bool isAuditPage;
  final String? nome;
  final String? celular;
  final String? email;
  final String? modelo;
  final String? ano;
  final String? cor;
  final String? km;
  final String? mecanico;
  final String? placa;

  VehicleDetailsDialog({
    Key? key,
    required this.isTablet,
    this.isAuditPage = false,
    required this.nome,
    required this.celular,
    required this.email,
    required this.modelo,
    required this.ano,
    required this.cor,
    required this.km,
    required this.mecanico,
    required this.placa,
  }) : super(key: key) {
    _nomeEditingController = TextEditingController(text: nome ?? '');
    _celularEditingController = TextEditingController(text: celular ?? '');
    _emailEditingController = TextEditingController(text: email ?? '');
    _modeloEditingController = TextEditingController(text: modelo ?? '');
    _anoEditingController = TextEditingController(text: ano ?? '');
    _corEditingController = TextEditingController(text: cor ?? '');
    _kmEditingController = TextEditingController(text: km ?? '');
    _mecanicoEditingController = TextEditingController(text: mecanico?? '');
  }

  late TextEditingController _nomeEditingController;
  late TextEditingController _celularEditingController;
  late TextEditingController _emailEditingController;
  late TextEditingController _modeloEditingController;
  late TextEditingController _anoEditingController;
  late TextEditingController _corEditingController;
  late TextEditingController _kmEditingController;
  late TextEditingController _mecanicoEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: isTablet ? MediaQuery.of(context).size.width / 4 : MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.height,
          child: Card(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ListView(
                    children: [
                      // imagem
                      Center(child: Image.asset('assets/img/Model3.png', width: 160)),

                      // placa
                      Align(
                        child: Column(
                          children: [
                            Container(alignment: Alignment.center, width: 80, height: 10, color: Colors.blue.shade900),
                            Container(
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border.all(width: .5, color: Colors.black87)), 
                              child: Text(placa ?? 'No Plate'),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),

                      // status
                      Align(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade900.withOpacity(.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('Aguardando', style: TextStyle(color: Colors.orange.shade900)),
                        ),
                      ),

                      Divider(),

                      _buildSectionTile('Informações do Cliente'),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: _buildFormField(
                          label: 'Nome Completo', 
                          hintText: 'digite o nome',
                          textController: _nomeEditingController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: _buildFormField(
                          label: 'Celular', 
                          hintText: '(15) 9966-5259',
                          textController: _celularEditingController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: _buildFormField(
                          label: 'e-Mail', 
                          hintText: 'teste@teste.com.br',
                          textController: _emailEditingController,
                        ),
                      ),

                      Divider(),

                      _buildSectionTile('Informações do Veículo'),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: _buildFormField(
                          label: 'Modelo', 
                          hintText: 'Modelo S',
                          textController: _modeloEditingController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: _buildFormField(
                          label: 'Versão / Ano', 
                          hintText: 'Long Range / 2021',
                          textController: _anoEditingController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: _buildFormField(
                          label: 'Cor', 
                          hintText: 'Azul Metálico',
                          textController: _corEditingController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: _buildFormField(
                          label: 'Kilometragem', 
                          hintText: '10.000 KM',
                          textController: _kmEditingController,
                        ),
                      ),
                      if (isAuditPage)  
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                          child: _buildFormField(
                            label: 'Mecânico Responsável', 
                            hintText: 'Carlos Bergano', 
                            textController: _mecanicoEditingController,
                          ),
                        ),

                      SizedBox(height: 20),

                      _buildActionButton('Iniciar Entrada', onPressed: () {}),
                      if (!isAuditPage) SizedBox(height: 10),
                      if (!isAuditPage) _buildActionButton('Desistência', bordered: true, onPressed: () {}),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(), 
                    icon: Icon(Icons.clear)
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
      
  }

  Widget _buildActionButton(String label, {
    bool bordered = false, required VoidCallback onPressed
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: InkWell(
        radius: 3,
        onTap: onPressed, 
        child: Container(
          height: 40,
          child: Center(
            child: Text(
              label, 
              style: TextStyle(
                color: bordered ? Colors.orange.shade900 : Colors.white)
              ),
            ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: bordered ? Colors.transparent : Colors.orange.shade900,
            border: bordered ? Border.all(color: Colors.orange.shade900) : null
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTile(String sectionLabel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sectionLabel),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label, 
    required String hintText,
    bool enabled = true,
    required TextEditingController textController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 6),
        SizedBox(
          height: 40,
          child: TextField(
            controller: textController,
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffFBFAFC),
              hintText: hintText,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEBEAED))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEBEAED))
              ),
            ),
          ),
        ),
      ],
    );
  }
}
