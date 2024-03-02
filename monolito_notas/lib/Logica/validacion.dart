// ignore_for_file: unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:monolito_notas/Data/firebase.dart';
import 'package:quickalert/quickalert.dart';

 validateTextFields(
    {required titleController,
    required TextEditingController descripController,
    required TextEditingController contextController,
    required BuildContext context}) async {
  await animacionCarga(context);
  if (titleController.text.toString().isEmpty) {
    Navigator.pop(context);
    errorMensaje(context, "Por favor, ingresa un título.");
  } else if (descripController.text.isEmpty) {
    Navigator.pop(context);
    errorMensaje(context, "Por favor, ingresa una descripción.");
  } else if (contextController.text.isEmpty) {
    Navigator.pop(context);
    errorMensaje(context, "Por favor, ingresa un contexto.");
  } else {
    var reques= await addNote(
        title: titleController.text.toString(),
        descrip: descripController.text.toString(),
        context: contextController.text.toString());
    Navigator.pop(context);
  reques ? correctoMensaje(context, "Nota Registrada.") : errorMensaje(context, "Problemas con el registro.");

  }
}

Future<void> animacionCarga(BuildContext context) async {
  showDialog(
    barrierColor: Color.fromARGB(141, 58, 175, 109),
    context: context,
    builder: (BuildContext context) {
      return Container(
        alignment: Alignment.center,
        child: LoadingAnimationWidget.newtonCradle(
          color: Colors.white,
          size: 150.0,
        ),
        width: double.infinity,
        height: double.infinity,
      );
    },
    barrierDismissible: false,
  );
}

Future errorMensaje(BuildContext context, String mensaje) {
  return QuickAlert.show(
    confirmBtnText: "Entendido",
    context: context,
    barrierColor: Color.fromARGB(160, 158, 165, 216),
    confirmBtnColor: const Color.fromARGB(255, 18, 34, 157),
    type: QuickAlertType.error,
    title: 'Oops...',
    text: mensaje,
  );
}

Future correctoMensaje(BuildContext context, String mensaje) {
  return QuickAlert.show(
      context: context,
      title: mensaje,
      text: "",
      type: QuickAlertType.success,
      barrierColor: Color.fromARGB(160, 158, 165, 216),
      confirmBtnColor: const Color.fromARGB(255, 18, 34, 157),
      confirmBtnText: "Confirmar",
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
      });
}
