import 'dart:math';

import 'package:flutter/material.dart';

class GradienteView extends StatefulWidget {
  final int tipo;
  const GradienteView({super.key, required this.tipo});

  @override
  State<GradienteView> createState() => _GradienteViewState();
}

class _GradienteViewState extends State<GradienteView> {
  int tipo = 0;

  TextEditingController P = TextEditingController();
  TextEditingController A = TextEditingController();
  TextEditingController G = TextEditingController();
  TextEditingController I = TextEditingController();
  TextEditingController N = TextEditingController();

  int tiempoI = 1;
  int tiempoN = 1;

  @override
  void initState() {
    tipo = widget.tipo;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE0E0E0),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              Text('Gradiente ${tipo==1?'ASC':'DES'}', 
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              Input(componente: P, titulo: 'Valor presente'),
              Input(componente: A, titulo: 'Valor de la primera cuota de la serie '),
              Input(componente: G, titulo: 'Constante en que aumenta cada cuota'),
              Row(
                children: [
                  Expanded(
                    child:
                    Input(componente: I, titulo: 'Tasa de interés de la operación'),
                  ),
                  const SizedBox(width: 10,),
                  ComboTiempo(tiempoI: tiempoI, tiempoN: tiempoN, tipoCombo: 1, funcion: cambiarTiempo, )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: 
                    Input(componente: N, titulo: 'Número de pagos o ingresos')
                  ),
                  const SizedBox(width: 10,),
                  ComboTiempo(tiempoI: tiempoI, tiempoN: tiempoN, tipoCombo: 2, funcion: cambiarTiempo, )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: ()=>calcular(context), child: const Text('Calcular')),
        ],
      ),
    );
  }
  
  cambiarTiempo(tiempo, asignarA) {
    if(tiempo==null){
      return;
    }
    if(asignarA==1){
      tiempoI = tiempo;
    }else{
      tiempoN = tiempo;
    }
    setState(() {});
  }

  calcular(context){
    String strP = P.text.trim();
    String strA = A.text.trim();
    String strG = G.text.trim();
    String strI = I.text.trim();
    String strN = N.text.trim();
    String cod = '';

    cod += strP=='' ? '0' : '1';
    cod += strA=='' ? '0' : '1';
    cod += strG=='' ? '0' : '1';
    cod += strI=='' ? '0' : '1';
    cod += strN=='' ? '0' : '1';

    switch (cod) {
      case '01111': 

        double a = double.parse(strA);
        double g = double.parse(strG);
        double i = double.parse(strI);
        double n = obtenerTiempoN(double.parse(strN));
        
        double unomasi = i+1;
        dynamic unomasialan = pow(unomasi, n);
        dynamic resp1 = unomasialan - 1;
        dynamic resp2 = i * unomasialan;
        
        dynamic calc1 = resp1 / resp2;

        dynamic lado1 = a * calc1;

        dynamic lado2 = (g/i) * (calc1 - (n/unomasialan));

        dynamic resultado = 0;
        if(tipo==1){
          resultado = lado1 + lado2;
        }else{
          resultado = lado1 - lado2;
        }

        P.text = '$resultado';

        setState(() {});
      break;
      case '10111': 
        double p = double.parse(strP);
        double g = double.parse(strG);
        double i = double.parse(strI);
        double n = obtenerTiempoN(double.parse(strN));

        double unomasi = i+1;
        dynamic unomasialan = pow(unomasi, n);
        dynamic resp1 = unomasialan - 1;
        dynamic resp2 = i * unomasialan;

        dynamic calc1 = resp1 / resp2;
        dynamic lado2 = (g/i) * (calc1 - (n/unomasialan));

        dynamic resp;
        if(tipo==1){
          resp = (-lado2 + p) / calc1;
        }else{
          resp = (lado2 + p) / calc1;
        }

        A.text = '$resp';
      break;
      case '11011': 
        double a = double.parse(strA);
        double p = double.parse(strP);
        double i = double.parse(strI);
        double n = obtenerTiempoN(double.parse(strN));
        
        double unomasi = i+1;
        dynamic unomasialan = pow(unomasi, n);
        dynamic resp1 = unomasialan - 1;
        dynamic resp2 = i * unomasialan;
        
        dynamic calc1 = resp1 / resp2;

        dynamic lado1 = a * calc1;
        dynamic lado2 = (calc1 - (n/unomasialan));

        dynamic resultado = (((p-lado1)*i)/lado2);

        if(tipo==2){
          resultado = resultado * -1;
        }

        G.text = '$resultado';
      break;
      default:
        const snackBar = SnackBar(
          content: Text('Error en el número de incognitas'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      break;
    }


  }

  obtenerTiempoN(n){
    if(tiempoI==tiempoN){
      return n;
    }


    //necesitamos pasar n a dias
    if(tiempoI==1){
      switch (tiempoN) {
        //diario
        case 1: return n;
        //mensual
        case 2: return n * 30;
        //bimestral
        case 3: return n * (30 * 2);
        //trimestral
        case 4: return n * (30 * 3);
        //semestral
        case 5: return n * 182.5;
      }
    }

    //necesitamos pasar n a mensual
    if(tiempoI==2){
      switch (tiempoN) {
        //diario
        case 1: return n / 30;
        //mensual
        case 2: return n;
        //bimestral
        case 3: return n * 2;
        //trimestral
        case 4: return n * 3;
        //semestral
        case 5: return n * 6;
      }
    }

    //necesitamos pasar n a bimestre
    if(tiempoI==3){
      switch (tiempoN) {
        //diario
        case 1: return n / (30 * 2);
        //mensual
        case 2: return n / 2;
        //bimestral
        case 3: return n;
        //trimestral
        case 4: return n * 3 / 2;
        //semestral
        case 5: return n * 6 / 2;
      }
    }

    //necesitamos pasar n a trimestre
    if(tiempoI==4){
      switch (tiempoN) {
        //diario
        case 1: return n / (30 * 3);
        //mensual
        case 2: return n / 3;
        //bimestral
        case 3: return n / 2;
        //trimestral
        case 4: return n;
        //semestral
        case 5: return n * 2;
      }
    }

    //necesitamos pasar na a semestre
    if(tiempoI==5){
      switch (tiempoN) {
        //diario
        case 1: return n / (30 * 6);
        //mensual
        case 2: return n / 6;
        //bimestral
        case 3: return n / 3;
        //trimestral
        case 4: return n / 2;
        //semestral
        case 5: return n;
      }
    }


  }

}

class ComboTiempo extends StatelessWidget {
  const ComboTiempo({
    super.key,
    required this.tiempoI,
    required this.tiempoN, 
    required this.tipoCombo, 
    required this.funcion,

  });

  final int tiempoI;
  final int tiempoN;
  final int tipoCombo;
  final Function funcion;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: Colors.black45))
        ),
        child: DropdownButton(
        underline: Container(),
        value: tipoCombo==1 ? tiempoI : tiempoN,
        items: const[                    
          DropdownMenuItem(value: 1, child: Text('Diario'),),
          DropdownMenuItem(value: 2, child: Text('Mensual')),
          DropdownMenuItem(value: 3, child: Text('Bimestral')),
          DropdownMenuItem(value: 4, child: Text('Trimestral')),
          DropdownMenuItem(value: 5, child: Text('Semestral')),
        ], 
        onChanged: (value)=>funcion(value, tipoCombo)
      ),
      )
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.componente,
    this.titulo
  });

  final TextEditingController componente;
  final dynamic titulo;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: componente,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: titulo,
        prefixIcon: const Icon(Icons.numbers),
        suffixIcon: IconButton(icon: const Icon(Icons.close), onPressed: ()=>componente.clear(),)
      ),
    );
  }
}

