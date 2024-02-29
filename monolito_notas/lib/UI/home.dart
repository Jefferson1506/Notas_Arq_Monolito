// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monolito_notas/UI/crearNotaPage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: estiloAppBar(context),
            backgroundColor: Color.fromARGB(255, 241, 234, 138),
            floatingActionButton: botonFlotante(context),
            body: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  filterQuality: FilterQuality.high,
                  colorBlendMode: BlendMode.darken,
                  color: Color.fromARGB(93, 255, 255, 0),
                  "Image/Fondo de papel.jpg",
                  fit: BoxFit.fill,
                )),
              ],
            ));
  }
}

AppBar estiloAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      "Listado De Notas",
      style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height * 0.03),
    ),
    elevation: MediaQuery.sizeOf(context).height * 0.03,
    backgroundColor: Color.fromARGB(255, 138, 76, 49),
    shadowColor: Color.fromARGB(255, 163, 50, 50),
    toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
    centerTitle: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40))),
  );
}

FloatingActionButton botonFlotante(BuildContext context) {
  return FloatingActionButton.extended(
    isExtended: true,
    icon: Icon(Icons.add_circle_outlined),
    label: Text('Agregar'),
    backgroundColor: const Color.fromARGB(255, 109, 240, 105),
    onPressed: () {
     
    },
  );
}
