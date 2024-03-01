import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:monolito_notas/Logica/controller.dart';
import 'package:monolito_notas/UI/crearNotaPage.dart';




class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: estiloAppBar(context),
      backgroundColor: Color.fromARGB(255, 241, 234, 138),
      floatingActionButton: botonFlotante(context),
      body: Obx(() => ListView.builder(
            itemCount: controller.notesList.length,
            itemBuilder: (context, index) {
              final note = controller.notesList[index];
              return CardWidget(
                title: note.title,
                description: note.descrip,
              );
            },
          )),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String description;

  CardWidget({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.robotoCondensed(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar estiloAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      "Listado De Notas",
      style: estiloTexto(context, Colors.black, 0.03),
    ),
    elevation: MediaQuery.of(context).size.height * 0.03,
    backgroundColor: Color.fromARGB(255, 166, 100, 71),
    shadowColor: Color.fromARGB(255, 163, 50, 50),
    toolbarHeight: MediaQuery.of(context).size.height * 0.08,
    centerTitle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
    ),
  );
}

FloatingActionButton botonFlotante(BuildContext context) {
  return FloatingActionButton.extended(
    isExtended: true,
    icon: Icon(Icons.add_circle_outlined),
    label: Text('Agregar'),
    backgroundColor: const Color.fromARGB(255, 109, 240, 105),
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CrearNotaPage()));
    },
  );
}

TextStyle estiloTexto(BuildContext context, Color color, double size) {
  return GoogleFonts.robotoCondensed(
    color: color,
    fontSize: MediaQuery.of(context).size.height * size,
  );
}
