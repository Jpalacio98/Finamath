import 'package:finanmath/Form/Component.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String dropdownValue1 = "i";
  String dropdownValue2 = "Mensual";
  String P = "0";
  String F = "0";
  String i = "0";
  String n = "0";
  List<String> dropdown = ['i', 'P', 'F', 'n'];
  List<String> botones = [
    'P',
    'F',
    'n',
  ];
  List<String> dropdown2 = [
    'Diario',
    'Mensual',
    'Bimestral',
    'Trimestral',
    'Semestral',
    'Anual'
  ];

  selectDrop1(value) {
    List<String> listAux = [];
    setState(() {
      String aux = dropdownValue1.toString();
      for (var element in botones) {
        if (element.toString() != value.toString()) {
          listAux.add(element.toString());
        }
      }
      listAux.add(aux.toString());
      botones.clear();
      botones.addAll(listAux);
      dropdownValue1 = value.toString();
      print(MediaQuery.of(context).size.width);
    });
  }

  selectDrop2(value) {
    setState(() {
      dropdownValue2 = value.toString();
    });
  }

  botonN() {}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            automaticallyImplyLeading: false,
            //leading: Container(color: Colors.transparent),
            // leading: const Imagenes(
            //   w: 30.0,
            //   h: 30.0,
            //   ruta: "assets/logoIcon.png",
            // ),
            backgroundColor: Colors.cyan,
            title: Imagenes(
              w: 180.0,
              h: 50.0,
              ruta: "assets/logo.png",
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline_rounded))
            ],
            bottom: const TabBar(tabs: [
              TextoTipo1(texto: "Interes S", tam: 12),
              TextoTipo1(texto: "Interes C", tam: 12),
              TextoTipo1(texto: "Gradiente A. Asc.", tam: 12),
              TextoTipo1(texto: "Gradiente A. Des.", tam: 12),
            ]),
          ),
          backgroundColor: const Color.fromARGB(248, 255, 255, 255),
          //bottomNavigationBar: Teclado(),
          body: TabBarView(children: [
            bodyWidget(),
            bodyWidget(),
            bodyWidget(),
            bodyWidget(),
          ])),
    );
  }

  Stack bodyWidget() {
    return Stack(alignment: const AlignmentDirectional(0, 0), children: [
      Align(
        alignment: const AlignmentDirectional(0, -.8),
        child: Container(
          //color: Colors.grey,
          width: 320, //MediaQuery.of(context).size.width * .9,
          height: 200,
          child: Stack(
            alignment: const AlignmentDirectional(0, 0),
            children: [
              Align(
                alignment: const AlignmentDirectional(-.9, -.9),
                child: Row(
                  children: [
                    const TextoTipo1(
                      texto: "Incongnita: ",
                    ),
                    TextoTipo2(texto: dropdownValue1.toString()),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-.9, -.5),
                child: Row(
                  children: [
                    const TextoTipo1(
                      texto: "Valor Presente(P): ",
                    ),
                    TextoTipo2(texto: "\$ $P"),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-.9, -.1),
                child: Row(
                  children: [
                    const TextoTipo1(
                      texto: "Valor Futuro(F): ",
                    ),
                    TextoTipo2(texto: "\$ $F"),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-.9, .3),
                child: Row(
                  children: [
                    const TextoTipo1(
                      texto: "Periodo(n): ",
                    ),
                    TextoTipo2(texto: "$n $dropdownValue2"),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-.9, .6),
                child: Row(
                  children: [
                    Container(
                      width: 320, //MediaQuery.of(context).size.width * .9,
                      height: 1,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-.9, .9),
                child: Row(
                  children: const [
                    TextoTipo1(
                      texto: "Resultado: 0",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Align(alignment: const AlignmentDirectional(0, .4), child: teclado())
    ]);
  }

  Container teclado() {
    return Container(
      width: 340,
      height: 275,
      //color: Colors.grey[700],
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              BotonTeclado(
                texto: "1",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                texto: "2",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                texto: "3",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                child: dropButton(" Incognita", 60, 50, dropdownValue1,
                    dropdown, selectDrop1),
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                texto: botones[0].toString(),
                wTexto: 18.0,
                funcion: () {},
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              BotonTeclado(
                texto: "4",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                texto: "5",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                texto: "6",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                texto: botones[1].toString(),
                wTexto: 18.0,
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                texto: botones[2].toString(),
                wTexto: 18.0,
                funcion: () {},
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              BotonTeclado(
                texto: "7",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                texto: "8",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                texto: "9",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              dropButton(" Medida de Tiempo", 125, 50, dropdownValue2,
                  dropdown2, selectDrop2),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              BotonTeclado(
                texto: "",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                texto: "0",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                texto: "",
                funcion: () {},
              ),
              const SizedBox(
                width: 5,
              ),
              BotonTeclado(
                w: 125.0,
                wTexto: 18.0,
                texto: "Calcular",
                funcion: () {},
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

}
