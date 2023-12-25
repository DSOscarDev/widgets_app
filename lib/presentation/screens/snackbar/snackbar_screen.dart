import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'ok!',onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }

  void openDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('estas seguro?'),
        content: const Text('parrafo descriptivo'),
        actions: [
          TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar'))
          
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars y Dialogos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context, 
                  children: [
                    const Text('descripcion del Diaologo Oscar')
                  ]
                );
              },
              child: const Text('Licencias Usadas')
            ),
            FilledButton.tonal(
              onPressed: ()=>openDialog(context),
              child: const Text('mostrar Diálogo')
            )            

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Mostrar SnackBars"),
        icon: const Icon(Icons.remove_red_eye_outlined),
        // onPressed: (){
        //   showCustomSnackBar(context);
        // },
        onPressed: ()=> showCustomSnackBar(context),
      ),
    );
  }
}