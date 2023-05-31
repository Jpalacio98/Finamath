import 'package:finanmath/Form/Calculadora.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

PreferredSize appbar1(BuildContext context) {
  return PreferredSize(
      preferredSize: const Size(200, 300),
      child: Container(
        decoration: const BoxDecoration(color: Colors.cyan, boxShadow: [
          BoxShadow(
              blurRadius: 7.0, color: Colors.grey, blurStyle: BlurStyle.solid)
        ]),
        width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .2,
        child: Stack(
          alignment: const AlignmentDirectional(0, 0),
          children: const [
            Align(
              alignment: AlignmentDirectional(0, .2),
              child: Imagenes(
                w: 200.0,
                h: 70.0,
                ruta: "assets/logo.png",
              ),
            )
          ],
        ),
      ));
}

Container botonTipo1(BuildContext context, IconData icono, String texto) {
  return Container(
    width: 100,
    height: 100,
    margin: const EdgeInsets.all(8.0),
    child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyan),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Calculadora()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono),
            const SizedBox(
              height: 7,
            ),
            Text(
              texto,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            )
          ],
        )),
  );
}

Container botonTipo2(BuildContext context, String texto,funcion) {
  return Container(
    width: 200,
    height: 70,
    margin: const EdgeInsets.all(8.0),
    child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyan),
        ),
        onPressed: funcion,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              texto,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            )
          ],
        )),
  );
}

class TextoTipo1 extends StatelessWidget {
  final texto;
  final tam;
  const TextoTipo1({Key? key, required this.texto, this.tam = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: double.parse(tam.toString())),
    );
  }
}

class TextoTipo2 extends StatelessWidget {
  final texto;
  final tam;
  const TextoTipo2({Key? key, required this.texto, this.tam = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: double.parse(tam.toString())),
    );
  }
}

class TextoTipo3 extends StatelessWidget {
  final texto;
  final tam;
  final align;
  final color;
  const TextoTipo3(
      {Key? key,
      required this.texto,
      this.tam = 26,
      this.align = TextAlign.right,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: double.parse(tam.toString()),
      ),
    );
  }
}

class BotonTeclado extends StatelessWidget {
  final texto;
  final w;
  final wTexto;
  final h;
  final color;
  final funcion;
  const BotonTeclado(
      {Key? key,
      required this.texto,
      this.w = 60.0,
      this.wTexto = 26.0,
      this.h = 60.0,
      this.color = Colors.grey,
      this.funcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: ElevatedButton(
          onPressed: funcion,
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll<Color>(
                Colors.cyan[200] ?? Colors.white,
              ),
              backgroundColor: MaterialStatePropertyAll<Color>(color),
              side: const MaterialStatePropertyAll<BorderSide>(
                  BorderSide(width: 2, color: Colors.black54))),
          child: TextoTipo3(
            texto: texto,
            align: TextAlign.center,
            tam: wTexto,
          )),
    );
  }
}

Column dropButton(String texto, double w, double h, String dropdownValue,
    List<String> lista, funcion) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      texto,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
    ),
    Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 2),
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
        child: InputDecorator(

          decoration: const InputDecoration(helperText: ""),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              dropdownColor:
                  Colors.cyan[200], //const Color.fromARGB(150, 117, 117, 117),
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              iconSize: 30,
              isExpanded: true,
              isDense: false,
              value: dropdownValue,
              iconEnabledColor: Colors.black,
              onChanged: funcion,
              items: lista.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    )
  ]);
}


SizedBox dropButton2(String texto, double w, String dropdownValue,
    List<String> lista, funcion) {
  return SizedBox(
    width: w,
    child: DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
        dropdownColor:
            Colors.cyan[200], //const Color.fromARGB(150, 117, 117, 117),
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal, color: Color.fromARGB(255, 95, 95, 95)),
        iconSize: 20,
        //isExpanded: true,
        //isDense: false,
        value: dropdownValue,
        alignment: AlignmentDirectional.centerEnd,
        iconEnabledColor: Colors.black,
        onChanged: funcion,
        items: lista.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ),
  );
}

class Imagenes extends StatelessWidget {
  final w;
  final h;
  final ruta;
  const Imagenes({Key? key, required this.ruta, this.w = 120.0, this.h = 50.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ruta), fit: BoxFit.fill)),
    );
  }
}
