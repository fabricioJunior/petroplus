import 'package:flutter/material.dart';

class VehicleDetailsDialog extends StatelessWidget {
  final bool isAuditPage;
  const VehicleDetailsDialog({ Key? key, this.isAuditPage = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: Card(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
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
                                child: Text('KLH6J34'),
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
                          child: _buildFormField(label: 'Nome Completo', hintText: 'digite o nome'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                          child: _buildFormField(label: 'Celular', hintText: '(15) 9966-5259'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                          child: _buildFormField(label: 'e-Mail', hintText: 'teste@teste.com.br'),
                        ),

                        Divider(),

                        _buildSectionTile('Informações do Veículo'),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                          child: _buildFormField(label: 'Modelo', hintText: 'Modelo S'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                          child: _buildFormField(label: 'Versão / Ano', hintText: 'Long Range / 2021'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                          child: _buildFormField(label: 'Cor', hintText: 'Azul Metálico'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                          child: _buildFormField(label: 'Kilometragem', hintText: '10.000 KM'),
                        ),
                        if (isAuditPage)  
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                            child: _buildFormField(label: 'Mecânico Responsável', hintText: 'Carlos Bergano', enabled: false),
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
                    padding: const EdgeInsets.only(top: 5.0, left: 8),
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
      ),
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
        children: [
          Text(sectionLabel),
          Expanded(
            child: IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.arrow_drop_down)
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label, 
    required String hintText,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 6),
        SizedBox(
          height: 40,
          child: TextField(
            enabled: enabled,
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