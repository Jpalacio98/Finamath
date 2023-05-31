// ignore_for_file: must_be_immutable, avoid_print

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:finanmath/Form/Component.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List<String> dropdown2 = [
    'Diario',
    'Mensual',
    'Bimestral',
    'Trimestral',
    'Semestral',
    'Anual'
  ];
  late List<Widget> tabs;
  @override
  void initState() {
    tabs = [
      VistaInteresSimple(
        titulo: "Interes Simple",
        dropdown2: dropdown2,
        modo: 0,
      ),
      VistaInteresSimple(
        titulo: "Interes Compuesto",
        dropdown2: dropdown2,
        modo: 1,
      ),
      const CommingSoon(),
      const CommingSoon(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
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
          title: const Imagenes(
            w: 180.0,
            h: 50.0,
            ruta: "assets/logo.png",
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.info_outline_rounded))
          ],
          bottom: const TabBar(tabs: [
            TextoTipo3(
              texto: "Interes S",
              tam: 12,
              align: TextAlign.center,
            ),
            TextoTipo3(
              texto: "Interes C",
              tam: 12,
              align: TextAlign.center,
            ),
            TextoTipo3(
              texto: "Gradiente A. Asc.",
              tam: 12,
              align: TextAlign.center,
            ),
            TextoTipo3(
              texto: "Gradiente A. Des.",
              tam: 12,
              align: TextAlign.center,
            ),
          ]),
        ), //appbar1(context),
        body: TabBarView(children: tabs),
      ),
    );
  }
}

class CajaTexto1 extends StatefulWidget {
  double w;
  String texto;
  IconData icono;
  String ht;
  TextEditingController controlador;
  CajaTexto1(
      {required this.w,
      required this.texto,
      this.icono = Icons.attach_money_rounded,
      required this.controlador,
      this.ht = "",
      super.key});

  @override
  State<CajaTexto1> createState() => _CajaTexto1State();
}

class _CajaTexto1State extends State<CajaTexto1> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.w,
        child: TextFormField(
            inputFormatters: [
              CurrencyTextInputFormatter(
                  locale: 'es-CO', symbol: "", decimalDigits: 2)
            ],
            controller: widget.controlador,
            decoration: InputDecoration(
              helperText: widget.ht,
              helperStyle: const TextStyle(
                  color: Colors.cyan, fontStyle: FontStyle.italic),
              fillColor: Colors.cyan[200],
              labelText: widget.texto,
              prefix: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Icon(
                  widget.icono,
                  size: 16,
                  color: const Color.fromARGB(255, 95, 95, 95),
                ),
              ),
              contentPadding: const EdgeInsets.all(0.0),
            ),
            keyboardType: TextInputType.number,
            onSaved: (value) {
              if (value?.isEmpty == null) {
                setState(() {
                  widget.controlador.text = '0';
                });
              }
            }));
  }
}

class CajaTexto2 extends StatefulWidget {
  double w;
  String texto;
  IconData icono;
  String ht;
  TextEditingController controlador;
  CajaTexto2(
      {required this.w,
      required this.texto,
      this.icono = Icons.percent_rounded,
      required this.controlador,
      this.ht = "",
      super.key});

  @override
  State<CajaTexto2> createState() => _CajaTexto2State();
}

class _CajaTexto2State extends State<CajaTexto2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.w,
        child: TextFormField(
            controller: widget.controlador,
            decoration: InputDecoration(
              helperText: widget.ht,
              helperStyle: const TextStyle(
                  color: Colors.cyan, fontStyle: FontStyle.italic),
              fillColor: Colors.cyan[200],
              labelText: widget.texto,
              suffix: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Icon(
                  widget.icono,
                  size: 16,
                  color: const Color.fromARGB(255, 95, 95, 95),
                ),
              ),
              contentPadding: const EdgeInsets.all(0.0),
            ),
            keyboardType: TextInputType.number,
            onSaved: (value) {
              if (value?.isEmpty == null) {
                setState(() {
                  widget.controlador.text = '0';
                });
              }
            }));
  }
}

class CajaTexto3 extends StatefulWidget {
  double w;
  String texto;
  IconData icono;
  String ht;
  TextEditingController controlador;
  CajaTexto3(
      {required this.w,
      required this.texto,
      this.icono = Icons.attach_money_rounded,
      required this.controlador,
      this.ht = "",
      super.key});

  @override
  State<CajaTexto3> createState() => _CajaTexto3State();
}

class _CajaTexto3State extends State<CajaTexto3> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.w,
        child: TextFormField(
            inputFormatters: [],
            controller: widget.controlador,
            decoration: InputDecoration(
              helperText: widget.ht,
              helperStyle: const TextStyle(
                  color: Colors.cyan, fontStyle: FontStyle.italic),
              fillColor: Colors.cyan[200],
              labelText: widget.texto,
              prefix: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Icon(
                  widget.icono,
                  size: 16,
                  color: const Color.fromARGB(255, 95, 95, 95),
                ),
              ),
              contentPadding: const EdgeInsets.all(0.0),
            ),
            keyboardType: TextInputType.number,
            onSaved: (value) {
              if (value?.isEmpty == null) {
                setState(() {
                  widget.controlador.text = '0';
                });
              }
            }));
  }
}

class VistaInteresSimple extends StatefulWidget {
  List<String> dropdown2;
  String titulo;
  int modo;
  VistaInteresSimple(
      {required this.titulo,
      required this.dropdown2,
      this.modo = 0,
      super.key});

  @override
  State<VistaInteresSimple> createState() => _VistaInteresSimpleState();
}

class _VistaInteresSimpleState extends State<VistaInteresSimple> {
  late TextEditingController p;
  late TextEditingController f;
  late TextEditingController n;
  late TextEditingController i;
  bool bandera = true;
  late InteresSimple ins;
  late InteresCompuesto inc;
  String incg1 = "";
  String incg2 = "";
  String incg3 = "";
  String incg4 = "";
  String btntxt = "Calcular";
  String dropdownValue1 = "Mensual";
  int indicedropdown1 = 1;
  int indicedropdown2 = 1;
  String dropdownValue2 = "Mensual";
  selectDrop2(value) {
    setState(() {
      dropdownValue2 = value.toString();
      indicedropdown2 = widget.dropdown2.indexOf(value);
      print(indicedropdown2);
    });
  }

  selectDrop1(value) {
    setState(() {
      dropdownValue1 = value.toString();
      indicedropdown1 = widget.dropdown2.indexOf(value);
      print(indicedropdown1);
    });
  }

  cambio() {
    if (bandera) {
      calcular();
      setState(() {
        btntxt = "Nuevo";
        bandera = false;
      });
    } else {
      nuevo();
      setState(() {
        btntxt = "Calcular";
        bandera = true;
      });
    }
  }

  nuevo() {
    p.clear();
    f.clear();
    n.clear();
    i.clear();
    dropdownValue1 = "Mensual";
    dropdownValue2 = "Mensual";
    incg1 = "";
    incg2 = "";
    incg3 = "";
    incg4 = "";
  }

  calcular() {
    if (widget.modo == 0) {
      print("calcula simple");
      calcularInteresSimple();
    } else {
      print("calcula compuesto");
      calcularInteresCompuesto();
    }
  }

  calcularInteresSimple() {
    validar();
    ins.p = double.parse(p.text.replaceAll('.', '').replaceAll(',', '.'));
    ins.f = double.parse(f.text.replaceAll('.', '').replaceAll(',', '.'));
    ins.n = double.parse(n.text);
    ins.i = double.parse(i.text);
    ins.criterio();
    p.text = FormatoMoneda(ins.p);
    f.text = FormatoMoneda(ins.f);
    n.text = textoFormato(ins.n);
    i.text = textoFormato(ins.i);
  }

  calcularInteresCompuesto() {
    validar();

    inc.p = double.parse(p.text.replaceAll('.', '').replaceAll(',', '.'));
    inc.f = double.parse(f.text.replaceAll('.', '').replaceAll(',', '.'));
    inc.n = double.parse(n.text);
    inc.i = double.parse(i.text);

    inc.criterio();
    p.text = FormatoMoneda(inc.p);
    f.text = FormatoMoneda(inc.f);
    n.text = textoFormato(inc.n);
    i.text = textoFormato(inc.i);
  }

  String textoFormato(double n) {
    double i = n;
    String s = i.toStringAsFixed(2).split(".")[1];
    int h = int.parse(s);
    if (h == 0) {
      return i.toStringAsFixed(2).split(".")[0];
    } else {
      return i.toString();
    }
  }

  validar() {
    if (p.text == "") {
      p.text = "0";
      setState(() {
        incg1 = "Incognita";
      });
    } else if (f.text == "") {
      f.text = "0";
      setState(() {
        incg2 = "Incognita";
      });
    } else if (n.text == "") {
      n.text = "0";
      setState(() {
        incg3 = "Incognita";
      });
    } else if (i.text == "") {
      i.text = "0";
      setState(() {
        incg4 = "Incognita";
      });
    } else {
      //alerta
    }
  }

  @override
  void initState() {
    p = TextEditingController();
    f = TextEditingController();
    n = TextEditingController();
    i = TextEditingController();
    ins = InteresSimple(
      p: 0,
      f: 0,
      i: 0,
      n: 0,
      iTiempo: indicedropdown2,
      nTiempo: indicedropdown1,
    );
    inc = InteresCompuesto(
      p: 0,
      f: 0,
      i: 0,
      n: 0,
      iTiempo: indicedropdown2,
      nTiempo: indicedropdown1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                TextoTipo1(
                  texto: widget.titulo,
                  tam: 22,
                ),
                const SizedBox(
                  height: 30,
                ),
                CajaTexto1(
                  texto: "Valor Presente",
                  w: 200,
                  controlador: p,
                  ht: incg1,
                ),
                const SizedBox(
                  height: 20,
                ),
                CajaTexto1(
                  texto: "Valor Futuro",
                  w: 200,
                  controlador: f,
                  ht: incg2,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CajaTexto3(
                      texto: "Periodo",
                      w: 80,
                      icono: Icons.calendar_month_outlined,
                      controlador: n,
                      ht: incg3,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: dropButton2("Tiempo ", 120, dropdownValue1,
                          widget.dropdown2, selectDrop1),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CajaTexto2(
                      texto: "Interes",
                      w: 80,
                      controlador: i,
                      ht: incg4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: dropButton2("Tiempo ", 120, dropdownValue2,
                          widget.dropdown2, selectDrop2),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                botonTipo2(context, btntxt, cambio)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommingSoon extends StatelessWidget {
  const CommingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Imagenes(ruta: "assets/logoIcon.png", w: 100.0, h: 100.0),
        Imagenes(ruta: "assets/logoTexto.png"),
        TextoTipo3(
          texto: "Comming Soon",
          tam: 26,
          color: Colors.cyan,
        )
      ],
    );
  }
}

class InteresSimple {
  late double p;
  late double f;
  late double n;
  late double i;
  late int nTiempo;
  late int iTiempo;
  late bool modo = true;
  List<List<double>> matrix = [
    [1, 30, 60, 90, 180, 360],
    [0.03, 1, 2, 3, 6, 12],
    [0.016, 0.5, 1, 1.5, 3, 6],
    [0.011, 0.33, 0.66, 1, 2, 4],
    [0.0055, 0.16, 0.33, 0.50, 1, 2],
    [0.0027, 0.083, 0.16, 0.25, 0, 5, 1],
  ];
  InteresSimple(
      {this.p = 0,
      this.f = 0,
      this.n = 0,
      this.i = 0,
      this.iTiempo = 1,
      this.nTiempo = 1});

  void todecimal(int num) {
    if (num == 0) {
      i = i / 100;
    } else {
      i = i * 100;
    }
  }

  void calcularI() {
    i = (1 / n) * ((f / p) - 1);
    todecimal(1);
    print(i);
  }

  void calcularN() {
    todecimal(0);
    n = (1 / i) * ((f / p) - 1);
    todecimal(1);
  }

  void calcularF() {
    todecimal(0);
    f = p * (1 + (n * i));
    todecimal(1);
  }

  void calcularP() {
    todecimal(0);
    p = f / (1 + (n * i));
    todecimal(1);
  }

  void criterio() {
    if (iTiempo == nTiempo) {
      criterio2();
    } else {
      conversion();
      criterio2();
      inversion();
    }
  }

  void criterio2() {
    if ((p == 0) && (f != 0 && i != 0 && n != 0)) {
      calcularP();
    } else if ((f == 0) && (p != 0 && i != 0 && n != 0)) {
      calcularF();
    } else if ((i == 0) && (p != 0 && f != 0 && n != 0)) {
      calcularI();
    } else if ((n == 0) && (p != 0 && i != 0 && f != 0)) {
      calcularN();
    } else {
      print("No se pueden tener 2 incognitas");
    }
  }

  void conversion() {
    i = i * matrix[iTiempo][nTiempo];
    //   2          1
  }

  void inversion() {
    i = i * matrix[nTiempo][iTiempo];
    //   2          1
  }
}

class InteresCompuesto {
  late double p;
  late double f;
  late double n;
  late double i;
  late int nTiempo;
  late int iTiempo;
  late bool modo = true;
  List<List<double>> matrix = [
    [1, 30, 60, 90, 180, 360],
    [0.03, 1, 2, 3, 6, 12],
    [0.016, 0.5, 1, 1.5, 3, 6],
    [0.011, 0.33, 0.66, 1, 2, 4],
    [0.0055, 0.16, 0.33, 0.50, 1, 2],
    [0.0027, 0.083, 0.16, 0.25, 0, 5, 1],
  ];
  InteresCompuesto(
      {this.p = 0,
      this.f = 0,
      this.n = 0,
      this.i = 0,
      this.iTiempo = 1,
      this.nTiempo = 1});

  void todecimal(int num) {
    if (num == 0) {
      i = i / 100;
    } else {
      i = i * 100;
    }
  }

  void calcularI() {
    i = pow(f / p, 1 / n) - 1;
    todecimal(1);
    print(i);
  }

  void calcularN() {
    todecimal(0);
    n = log(f / p) / log(1 + i);
    todecimal(1);
  }

  void calcularF() {
    todecimal(0);
    f = p * pow(1 + i, n);
    todecimal(1);
  }

  void calcularP() {
    todecimal(0);
    p = f / pow(1 + i, n);
    todecimal(1);
  }

  void criterio() {
    print(p);
    print(f);
    print(n);
    print(i);
    if (iTiempo == nTiempo) {
      criterio2();
    } else {
      conversion();
      criterio2();
      inversion();
    }
  }

  void criterio2() {
    if ((p == 0) && (f != 0 && i != 0 && n != 0)) {
      calcularP();
    } else if ((f == 0) && (p != 0 && i != 0 && n != 0)) {
      calcularF();
    } else if ((i == 0) && (p != 0 && f != 0 && n != 0)) {
      calcularI();
    } else if ((n == 0) && (p != 0 && i != 0 && f != 0)) {
      calcularN();
    } else {
      print("No se pueden tener 2 incognitas");
    }
  }

  void conversion() {
    i = i * matrix[iTiempo][nTiempo];
    //   2          1
  }

  void inversion() {
    i = i * matrix[nTiempo][iTiempo];
    //   2          1
  }
}

//       interes
//    d     m    b    t    s    a--------n
//d   1    30   60   90   180  360
//m   30   1    2    3     6    12
//b   60   2    1   1.5    3    6
//t   90   3   1.5   1     2    4
//s  180   6    3    2     1    2
//a  360   12   6    4     2    1
//|
//i
String FormatoMoneda(double numero) {
  NumberFormat f = NumberFormat("#,###.00#", "es_COP");
  String result = f.format(numero);
  return result;
}

String FormatoMoneda2(int numero) {
  NumberFormat f = NumberFormat("#,###.00#", "es_COP");
  String result = f.format(numero);
  return result;
}
