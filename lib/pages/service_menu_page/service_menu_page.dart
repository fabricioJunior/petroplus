import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:petroplus/controllers/product_controller.dart';
import 'package:petroplus/models/product_media_model.dart';
import 'package:petroplus/models/service_model.dart';
import 'package:petroplus/pages/delivery_audit/delivery_audit_page.dart';
import 'package:petroplus/pages/service_menu_page/widgets/add_item_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/appbar_uni_widget.dart';
import 'package:http/http.dart' as http;

import '../../controllers/service_controller.dart';
import '../../models/product_model.dart';
import '../../service_locator.dart';
import '../../widgets/circular_progress.dart';
import '../drawer_menu.dart/navigation_drawer_menu.dart';
import 'widgets/product_dialog.dart';
import 'widgets/service_dialog.dart';

class AnaliseVeiculoRotaMap {}

class ServiceMenuPage extends StatefulWidget {
  const ServiceMenuPage({Key? key}) : super(key: key);

  @override
  State<ServiceMenuPage> createState() => _ServiceMenuPageState();
}

class _ServiceMenuPageState extends State<ServiceMenuPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerPagina(),
// ------------------------------------------------Corpo
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ----------------------AppBar
            AppBarUniv(),
            // ----------------------

            Center(
              child: SizedBox(
                // width: MediaQuery.of(context).size.width * .9,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var isTablet = constraints.maxWidth > 500;
                    return Column(
                      children: [
// ------------------------------------------------Body/Tablet
                        if (isTablet) ...[
                          // ------------------------------------------------Checklists de Recepção
                          PacotesParaModelo(),
                          MyWidget(),
                        ],
// ------------------------------------------------Body/Mobile
                        if (!isTablet) ...[
                          // ------------------------------------------------Checklists de Recepção
                          PacotesParaModelo(),
                          MyWidget(),
                        ],
// ------------------------------------------------
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
// ------------------------------------------------
      ),
    );
  }
}

class PacotesParaModelo extends StatelessWidget {
  const PacotesParaModelo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 14,
                      color: Color.fromARGB(255, 136, 136, 136),
                    ),
                    Text(
                      "Voltar",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 136, 136, 136),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Pacotes para Model 3 (10.000KM)",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Pacote Básico",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "6x de",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          "R\$ 210,00",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: Color(0xffff6601),
                            ),
                            primary: Color.fromARGB(255, 255, 255, 255),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 7),
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        onPressed: () {},
                        child: Text(
                          "Alterar",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            color: Color(0xffff6601),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        "R\$ 1.260,00",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
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

// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  var _recommendationLength = 0;
  var _serviceLength = 0;
  
  var _isRecommendationLengthUpdated = false;
  var _isServiceLengthUpdated = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
              ),
              Text("Inclusos no Pacote (1)"),
              Divider(),
              PacoteTile(
                titleProduct: 'Troca de Oléo ',
                titleProductSubtitle: '2.7l de Oléo Selenia 5w30 - 1h30 de Mão de Obra',
                precoProduto: r'R$ 230,00',
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
              ),
              Text("Recomendados ($_recommendationLength)"),
              Divider(),
              FutureBuilder<ProductModel?>(
                future: locator.get<ProductController>().getRecommendations(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return buildCircularProgress();
                  } else if (snapshot.hasData) {

                    final productsModel = snapshot.data;
                    _setRecommendationLengthAfterLayout(productsModel!.itemsModel!.length);

                    return Column(
                      children: List.generate(
                        productsModel.itemsModel!.length, 
                        (index) => PacoteTile(
                          showInfoButton: true,
                          titleProduct: productsModel.itemsModel![index].name!,
                          titleProductSubtitle: productsModel.itemsModel![index].description!,
                          precoProduto: r'R$' ' ${productsModel.itemsModel![index].price ?? '0.0'}',
                          linkProdutoAcesso: () {
                            showDialog(
                              context: context, 
                              // barrierDismissible: false,
                              builder: (context) {
                                return FutureBuilder<ProductMediaModel?>(
                                  future: locator.get<ProductController>().getProductMedia(productsModel.itemsModel![index].id!),
                                  builder: (context, snapshotMedia) {
                                    if (snapshotMedia.hasData) {
                                      return ProductDialog(
                                        productMediasModel: snapshotMedia.data,
                                      );
                                    } else {
                                      return buildCircularProgress();
                                    }
                                  }
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return Text("Nenhuma recomendação encontrada :(");
                  }
                }
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
              ),
              Text("Recall (2)"),
              Divider(),
              PacoteTile(
                titleProduct: 'Troca de Oléo ',
                titleProductSubtitle: '2.7l de Oléo Selenia 5w30 - 1h30 de Mão de Obra',
                precoProduto: r'R$ 230,00',
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
              ),
              Text("Outros ($_serviceLength)"),
              Divider(),
              FutureBuilder<ServiceModel>(
                future: locator.get<ServiceController>().getServices(),
                builder: (context, snapshot) {
                  
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return buildCircularProgress();
                  } else if (snapshot.hasData) {

                    final servicesModel = snapshot.data;
                    _setServiceLengthAfterLayout(servicesModel!.itemsModel!.length);

                    return Column(
                      children: List.generate(
                        servicesModel.itemsModel!.length, 
                        (index) => PacoteTile(
                          titleProduct: servicesModel.itemsModel?[index].name ?? 'Título Produto',
                          titleProductSubtitle: servicesModel.itemsModel?[index].description ?? 'Descrição Produto',
                          precoProduto: r'R$' ' ${servicesModel.itemsModel?[index].price ?? '0.0'}',
                        ),
                      ),
                    );
                  } else {
                    return Text("Nenhum serviço encontrada :(");
                  }
                }
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (context) {
                    return AddItemDialog();
                  },
                );
              },
              child: Text(
                "+ Adicionar Item",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 141, 141, 141)
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffFF6601)),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) {
                  return DeliveryAuditPage();
                },
              ));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                "Finalizar Orçamento",
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
    );
  }

  void _setRecommendationLengthAfterLayout(int value) {
    if (!_isRecommendationLengthUpdated) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        setState(() => _recommendationLength = value);
      });
      _isRecommendationLengthUpdated = true;
    }
  }

  void _setServiceLengthAfterLayout(int value) {
    if (!_isServiceLengthUpdated) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        setState(() => _serviceLength = value);
      });
      _isServiceLengthUpdated = true;
    }
  }

}


class PacoteTile extends StatefulWidget {
  const PacoteTile(
      {Key? key,
      required this.titleProduct,
      required this.titleProductSubtitle,
      required this.precoProduto,
      this.showInfoButton = false,
      this.linkProdutoAcesso})
      : super(key: key);

  final String titleProduct;
  final String titleProductSubtitle;
  final String precoProduto;
  final VoidCallback? linkProdutoAcesso;
  final bool showInfoButton;

  @override
  State<PacoteTile> createState() => _PacoteTileState();
}

class _PacoteTileState extends State<PacoteTile> {
  final entradaItens = <Map>[
    {"nome": "Teste01", "check": false},
    {"nome": "Teste02", "check": false},
    {"nome": "Teste03", "check": false},
    {"nome": "Teste04", "check": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (widget.showInfoButton) 
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: InkWell(
                        child: Icon(Icons.info),
                        onTap: widget.linkProdutoAcesso,
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.titleProduct,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        widget.titleProductSubtitle,
                        style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff84818A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.precoProduto,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2E2C34),
                    ),
                  ),
                  Checkbox(
                    value: entradaItens[3]["check"],
                    onChanged: (value) {
                      setState(() {
                        entradaItens[3]["check"] = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
