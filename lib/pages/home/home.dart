import 'package:calculador_imc/pages/home/controller.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  GlobalKey<FormState> _fomState = GlobalKey<FormState>();

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  final modal = HomeController();

  String _result = 'Informe seus dados';

  void _refresh() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _result = 'Informe seus dados';
      _fomState = GlobalKey<FormState>();
    });
  }

  void calculate() {
    setState(() {
      _result = modal.calculate(
          peso: double.parse(weightController.text),
          altura: double.parse(heightController.text) / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Calculadora de Imc'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              _refresh();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          child: Form(
            key: _fomState,
            child: Column(
              children: [
                const Icon(
                  Icons.person_outlined,
                  color: Colors.green,
                  weight: 800,
                  size: 200,
                ),
                TextFormField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    label: Text(
                      'Peso(kg)',
                    ),
                    labelStyle: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                       return "Ensira o seu peso";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Altura(cm)'),
                    labelStyle: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                       return "Ensira a sua altura";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_fomState.currentState!.validate()){
                        calculate();
                      }
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.green),
                        textStyle: MaterialStateProperty.resolveWith(
                            (states) => const TextStyle(
                                  fontSize: 20,
                                ))),
                    child: const Text('Calcular'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _result,
                  style: const TextStyle(color: Colors.green, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
