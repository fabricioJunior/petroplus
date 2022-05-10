import 'package:flutter/material.dart';

class ServiceDialog extends StatelessWidget {

  const ServiceDialog({
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
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          8, 
                          (index) => Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(20.0),
                            child: Placeholder(),
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
