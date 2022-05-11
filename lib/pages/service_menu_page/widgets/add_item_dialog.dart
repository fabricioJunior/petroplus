import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {

  const AddItemDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.height * .5,
              height: MediaQuery.of(context).size.height * .7,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Adicionar Serviço', style: TextStyle(fontSize: 25)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      // height: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Digita o nome do serviço que deseja adicionar'),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffFBFAFC),
                              hintText: 'ex: Filtro de Óleo',
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEBEAED))
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEBEAED))
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Placeholder(),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xffFF6601)),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          "Adicionar Serviço",
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(), 
                  icon: Icon(Icons.clear)
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
