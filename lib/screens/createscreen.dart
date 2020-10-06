import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CreateScreen extends StatefulWidget {
  CreateScreen({Key key}) : super(key: key);

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar nova planta'),
        backgroundColor: Color(0xFF32A060),
      ),
      body: FormBuilder(
        key: _fbKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  top: 50.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FormBuilderTextField(
                      maxLines: 1,
                      attribute: 'nomeComum',
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Nome Comum",
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.max(70),
                      ],
                    ),
                    SizedBox(height: 30),
                    FormBuilderTextField(
                      attribute: 'nomeCientífico',
                      decoration: InputDecoration(
                          isDense: true,
                          border: UnderlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          labelText: "Nome Científico"),
                    ),
                    SizedBox(height: 30),
                    FormBuilderDropdown(
                      attribute: 'quantiaAgua',
                      decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          labelText: "Umidade"),
                      validators: [FormBuilderValidators.required()],
                      items: [
                        'Solo levemente seco',
                        'Solo levemente umido',
                        'Solo úmido',
                        'Solo bastante úmido',
                      ]
                          .map((quantiaAgua) => DropdownMenuItem(
                              value: quantiaAgua, child: Text("$quantiaAgua")))
                          .toList(),
                    ),
                    SizedBox(height: 20),
                    FormBuilderDropdown(
                      attribute: 'quantiaSol',
                      decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          labelText: "Luminosidade"),
                      validators: [FormBuilderValidators.required()],
                      items: [
                        'Sombra',
                        'Meia Sombra',
                        'Sol pleno ou Meia sombra',
                        'Sol pleno',
                      ]
                          .map((quantiaSol) => DropdownMenuItem(
                              value: quantiaSol, child: Text("$quantiaSol")))
                          .toList(),
                    ),
                    SizedBox(height: 25),
                    FormBuilderTextField(
                      attribute: 'temperatura',
                      maxLines: 7,
                      maxLengthEnforced: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          labelText: "Temperatura"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                      child: Text('Finalizar'),
                      onPressed: () {
                        if (_fbKey.currentState.saveAndValidate()) {
                          print(_fbKey.currentState.value);
                        }
                      }),
                  RaisedButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      _fbKey.currentState.reset();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
