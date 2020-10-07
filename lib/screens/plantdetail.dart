import 'package:Ipot/models/plant.dart';
import 'package:Ipot/services/database_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlantDetail extends StatefulWidget {
  final Plant plant;

  const PlantDetail({Key key, this.plant}) : super(key: key);

  @override
  _PlantDetailState createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Container(
            child: getPlantDetail(),
          ),
        ),
      ),
    );
  }

  Widget getPlantDetail() {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 60.0,
                ),
                height: 460.0,
                color: Color(0xFF32A060),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Nome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      widget.plant.nomeComum,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Nome Científico',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      widget.plant.nomeCientifico ?? "",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Umidade',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      widget.plant.quantiaAgua,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Luminosidade',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      widget.plant.quantiaSol,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RawMaterialButton(
                          padding: EdgeInsets.all(20.0),
                          shape: CircleBorder(),
                          elevation: 2.0,
                          fillColor: Colors.greenAccent,
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 35.0,
                          ),
                          onPressed: () => updatePlanta(),
                        ),
                        RawMaterialButton(
                          padding: EdgeInsets.all(20.0),
                          shape: CircleBorder(),
                          elevation: 2.0,
                          fillColor: Colors.redAccent,
                          child: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.black,
                            size: 35.0,
                          ),
                          onPressed: () => deletePlanta(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20.0,
              ),
              child: Column(
                children: [
                  Text(
                    'Temperatura',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    widget.plant.temperatura,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  updatePlanta() {
    if (widget.plant.ativo != null) {
      widget.plant.ativo = !widget.plant.ativo;
    } else {
      widget.plant.ativo = true;
    }
    DatabaseConnection().updatePlant(widget.plant);
  }

  deletePlanta(){
    DatabaseConnection().deletePlant(widget.plant);
  }
}
