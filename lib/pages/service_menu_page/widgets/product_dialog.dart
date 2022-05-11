import 'package:flutter/material.dart';

import 'package:petroplus/models/product_media_model.dart';

class ProductDialog extends StatelessWidget {
  final ProductMediaModel? productMediasModel;

  const ProductDialog({
    Key? key,
    required this.productMediasModel,
  }) : super(key: key);

  MediaModel? get _principalProductMedia {
    // return productMediasModel?.medias?.firstWhere((e) => e.isPrincipal);
    return productMediasModel?.medias?.first;
  }

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
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Image.network(_principalProductMedia!.url!),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          productMediasModel?.medias?.length ?? 0, 
                          (index) => Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(20.0),
                            child: productMediasModel!.medias!.isEmpty ? Placeholder() : Image.network(productMediasModel!.medias![index].url!)
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
