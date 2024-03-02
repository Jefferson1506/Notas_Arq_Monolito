// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monolito_notas/Data/firebase.dart';
import 'package:monolito_notas/Data/model.dart';
import 'package:monolito_notas/Logica/validacion.dart';
import 'package:monolito_notas/UI/crearNotaPage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: estiloAppBar(context),
      backgroundColor: Color.fromARGB(255, 241, 234, 138),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: BodyNotes(),
      ),
    );
  }
}

class BodyNotes extends StatefulWidget {
  const BodyNotes({super.key});

  State<BodyNotes> createState() => _BodyNotesState();
}

class _BodyNotesState extends State<BodyNotes> {
  List<Notes> listNotes = [];

  @override
  void initState() {
    super.initState();
    llenarListas();
  }

  void llenarListas() async {
    listNotes = await getNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: botonFlotante(context),
        backgroundColor: Color.fromARGB(255, 241, 234, 138),
        body: GridView.builder(
          itemCount: listNotes.length,
          itemBuilder: (context, index) => itemNotes(
              itemNo: index,
              title: listNotes[index].title,
              descrip: listNotes[index].descrip,
              context: listNotes[index].context,
              fecha: listNotes[index].fecha,
              id: listNotes[index].id,
              context2: context),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
        ));
  }

  Widget itemNotes(
      {required itemNo,
      required title,
      required descrip,
      required context,
      required fecha,
      required id,
      required context2}) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        color: Colors.white,
        elevation: 20,
        child: ListTile(
          splashColor: Colors.black,
          tileColor: color.withOpacity(0.3),
          title: Text("${title}\n"),
          subtitle: Text("${fecha}"),
          onLongPress: () async {
            await alertMensaje(context2, "Borrar la nota : ${title}", id);
            llenarListas();
          },
          leading: Container(
            width: 50,
            height: 30,
            color: color.withOpacity(0.5),
            child: Placeholder(
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  FloatingActionButton botonFlotante(BuildContext context) {
    return FloatingActionButton.extended(
      isExtended: true,
      icon: Icon(Icons.add_circle_outlined),
      label: Text('Agregar'),
      backgroundColor: const Color.fromARGB(255, 109, 240, 105),
      onPressed: () async {
        await Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CrearNotaPage()));
        llenarListas();
      },
    );
  }
}

/************************************************* */

AppBar estiloAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      "Listado De Notas",
      style:
          estiloTexto(context, const Color.fromARGB(255, 255, 255, 255), 0.03),
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

TextStyle estiloTexto(BuildContext context, Color color, size) {
  return GoogleFonts.robotoCondensed(
    color: color,
    fontSize: MediaQuery.sizeOf(context).height * size,
  );
}
