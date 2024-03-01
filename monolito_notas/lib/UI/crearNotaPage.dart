// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:monolito_notas/Logica/validacion.dart';
import 'package:monolito_notas/UI/home.dart';

TextEditingController titleController = TextEditingController();
TextEditingController descripController = TextEditingController();
TextEditingController contextController = TextEditingController();

class CrearNotaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 231, 170),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: ListView(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
                labelStyle: estiloTexto(context, Colors.black, 0.022),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                border: UnderlineInputBorder(
                    borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
              ),
            ),
            SizedBox(height: 40.0),
            TextFormField(
              controller: descripController,
              maxLength: 100,
              decoration: InputDecoration(
                labelText: 'Descripción (máx. 20 caracteres)',
                labelStyle: estiloTexto(context, Colors.black, 0.022),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                border: UnderlineInputBorder(
                    borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: contextController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Cuerpo de la nota',
                labelStyle: estiloTexto(context, Colors.black, 0.022),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(context, Icon(Icons.back_hand, color: Colors.white),
                    "Cancelar", Colors.redAccent, () => Navigator.pop(context)),
                button(
                    context,
                    Icon(
                      Icons.done_all,
                      color: Colors.white,
                    ),
                    "Guardar",
                    Color.fromARGB(255, 43, 200, 29),
                    () => validateTextFields(
                          titleController: titleController,
                          descripController: descripController,
                          contextController: contextController,
                          context: context,
                        )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

ButtonStyle estilosBotones(BuildContext context, Color colorFondo) {
  return ElevatedButton.styleFrom(
      backgroundColor: colorFondo,
      minimumSize: Size(MediaQuery.sizeOf(context).width * 0.06,
          MediaQuery.sizeOf(context).height * 0.05),
      alignment: Alignment.center,
      side: BorderSide(
        color: Colors.black,
        width: 2,
      ));
}

ElevatedButton button(BuildContext context, Icon icon, String texto,
    Color color, VoidCallback action) {
  return ElevatedButton.icon(
    style: estilosBotones(context, color),
    icon: icon,
    label: Text(
      texto,
      style: estiloTexto(context, Colors.white, 0.02),
    ),
    onPressed: () => action(),
  );
}
