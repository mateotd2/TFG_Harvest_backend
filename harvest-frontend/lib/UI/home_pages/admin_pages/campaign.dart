import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harvest_api/api.dart';
import 'package:harvest_frontend/UI/home_pages/admin_pages/not_completed_tasks.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../../utils/plataform_apis/campanha_api.dart';
import '../../../utils/provider/sign_in_model.dart';
import '../../../utils/snack_bars.dart';

class Campaign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  var logger = Logger();
  late Future<PhaseCampaign?> fase;
  bool restart = false;

  @override
  Widget build(BuildContext context) {
    final estado = Provider.of<SignInResponseModel>(context);
    OAuth auth = OAuth(accessToken: estado.lastResponse!.accessToken);
    final api = campanhaApiPlataform(auth);

    setState(() {
      fase = api.getPhaseCampaign().timeout(Duration(seconds: 10));
    });

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          setState(() {
            fase = api.getPhaseCampaign().timeout(Duration(seconds: 10));;
          });
        },
        child: FutureBuilder(
            future: fase,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              String textoFase = "";
              if (snapshot.hasError) {
                return Center(
                    child: Text("Comunicación con el servidor fallida "));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                PhaseCampaign? faseObtenida = snapshot.data;
                snapshot.connectionState == ConnectionState.done;
                switch (faseObtenida) {
                  case null:
                    textoFase = "";
                  case PhaseCampaign.LIMPIEZA:
                    textoFase = "Limpieza";
                  case PhaseCampaign.PODA:
                    textoFase = "Poda";
                  case PhaseCampaign.RECOLECCION_CARGA:
                    textoFase = "Recolección y Carga";
                  case PhaseCampaign.CAMPAIGN_ENDED:
                    textoFase = "Finalizada";
                  case PhaseCampaign.CAMPAIGN_NOT_STARTED:
                    textoFase = "";
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 32.0),
                      Visibility(
                          visible: textoFase.isNotEmpty ||
                              PhaseCampaign.CAMPAIGN_ENDED == faseObtenida,
                          child: Text("Fase actual: $textoFase",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          replacement: Text(
                            "Campaña no iniciada",
                            style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(height: 32.0),
                      Visibility(
                        visible: faseObtenida == PhaseCampaign.CAMPAIGN_NOT_STARTED,
                        replacement: ElevatedButton(
                            onPressed: () {},
                            child: Text("Comenzar campaña"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey)),
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Confirmación"),
                                      content: Text(
                                          "Seguro que desea inicar la campaña anual?"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              logger.d("Cancelado inicio de campaña");
                                            },
                                            child: Text('Cancelar'),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red)),
                                        ElevatedButton(
                                            onPressed: () async {
                                              try {
                                                await api
                                                    .startCampaign()
                                                    .timeout(Duration(seconds: 10));
                                                setState(() {
                                                  restart = !restart;
                                                });
                                                snackGreen(
                                                    context, 'Comenzando campaña');
                                              } on TimeoutException {
                                                snackTimeout(context);
                                              } catch (e) {
                                                snackRed(context,
                                                    'Error al comenzar la campaña.');
                                              }
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Aceptar'))
                                      ],
                                    );
                                  });

                            },
                            child: Text("Comenzar campaña")),
                      ),
                      SizedBox(height: 64.0),
                      Visibility(
                        visible: faseObtenida == PhaseCampaign.LIMPIEZA,
                        replacement: ElevatedButton(
                            onPressed: () {},
                            child: Text("Comenzar fase de poda"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey)),
                        child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NotCompletedTasks(
                                          typePhase: TypePhase.cleaning)));
                              setState(() {
                                restart = !restart;
                              });
                            },
                            child: Text("Comenzar fase de poda")),
                      ),
                      SizedBox(height: 64.0),
                      Visibility(
                        visible: faseObtenida == PhaseCampaign.PODA,
                        replacement: ElevatedButton(
                            onPressed: () {},
                            child: Text("Comenzar fase de recoleccion"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey)),
                        child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NotCompletedTasks(
                                          typePhase: TypePhase.pruning)));
                              setState(() {
                                restart = !restart;
                              });
                            },
                            child: Text("Comenzar fase de recoleccion")),
                      ),
                      SizedBox(height: 64.0),
                      Visibility(
                        visible: faseObtenida == PhaseCampaign.RECOLECCION_CARGA,
                        replacement: ElevatedButton(
                            onPressed: () {},
                            child: Text("Finalizar campaña"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey)),
                        child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NotCompletedTasks(
                                          typePhase: TypePhase.harvest)));
                              setState(() {
                                restart = !restart;
                              });
                            },
                            child: Text("Finalizar campaña")),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
