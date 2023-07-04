import 'package:flutter/material.dart';
import 'package:gotraining/datasources/local_data_source.dart';
import 'package:gotraining/modules/agendamento/functions/mensagem_fuction.dart';
import 'package:gotraining/modules/calendar/models/calendar_model.dart';
import 'package:intl/intl.dart';

class AgendamentoStore extends ChangeNotifier {
  int currentStep = 0;
  List<Evento> eventos = [];
  late DatabaseHelper databaseHelper;
  bool isMonthFormat = true;
  String? valueBusiess;
  String? valueSolicitante;
  String? valueTreinamento;
  String? valueAvaliacao;
  String? valueParcerias;
  String? valueTema;
  String checking = "a";
  GlobalKey<FormState> globalKeyDataInicio = GlobalKey<FormState>();
  GlobalKey<FormState> globalKeyDataTermino = GlobalKey<FormState>();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> globalKeyTreinamento = GlobalKey<FormState>();
  GlobalKey<FormState> globalKeySolicitante = GlobalKey<FormState>();
  GlobalKey<FormState> globalKeyBusinessCenter = GlobalKey<FormState>();

  //
  final tipoTreinamento = ValueNotifier('');
  final tipoAvaliacaoTreinamento = ValueNotifier('');
  final tipoParceiros = ValueNotifier('');
  final tipoTema = ValueNotifier('');
  final tipoSolicitante = ValueNotifier('');
  final tipoBusinessCenter = ValueNotifier('');
  final lojaController = TextEditingController();
  final pontosController = TextEditingController();
  final limiteIncricoesController = TextEditingController();
  final publicoPrevistoController = TextEditingController();
  final observacaoController = TextEditingController();
  final cargaHorariaController = TextEditingController();
  final solicitanteController = TextEditingController();
  final parceirosController = TextEditingController();
  final controllerTimeInicio = TextEditingController();
  final controllerTimeTermino = TextEditingController();
  final dateCalendarioFormat = TextEditingController();
  final formatCalendar = DateFormat("dd/MM/yyyy");
  final format = DateFormat("HH:mm");
  DateTime diaFocado = DateTime.now();
  int valorChecking = 0;

  void updateSelectedDay(DateTime value) {
    selectedDate = value;
    notifyListeners();
  }

  void updateFocusedDay(DateTime value) {
    diaFocado = value;
    notifyListeners();
  }

//logica agendamento
/////////////////////////////////////////////////////////////
  late DateTime selectedDate = DateTime.parse(dateCalendarioFormat.text);
  int compararHorario(Evento a, Evento b) {
    return a.horario.compareTo(b.horario);
  }

  void loadEventos() async {
    final eventos = await DatabaseHelper.getEventos(selectedDate);
    eventos.sort(compararHorario);
    this.eventos = eventos;
    notifyListeners();
  }

  void adicionarEvento(Evento evento) async {
    await DatabaseHelper.salvarEvento(evento);
    loadEventos();
    notifyListeners();
  }

  void removerEvento(Evento evento) async {
    await DatabaseHelper.removerEvento(evento.id);
    loadEventos();
    notifyListeners();
  }

  void atualizarEvento(Evento evento) async {
    await DatabaseHelper.atualizarEvento(evento);
    loadEventos();
    notifyListeners();
  }

  void editarEvento(
      AgendamentoStore store, Evento evento, String novoChecking) {
    evento.checking = novoChecking;

    store.atualizarEvento(evento);
    notifyListeners();
  }

  addEvent() async {
    final evento = Evento(
      id: DateTime.now().millisecondsSinceEpoch,
      titulo: lojaController.text.toString(), //excluit
      descricao: lojaController.text.toString(), // excluir
      data: selectedDate,
      calendario: dateCalendarioFormat.text.toString(),
      cargaHoraria: cargaHorariaController.text.toString(),
      checking: checking,
      horario: controllerTimeTermino.text.toString(),
      limiteInscricoessricoes: limiteIncricoesController.text.toString(),
      local: valueBusiess.toString(),
      loja: lojaController.text.toString(),
      observacao: observacaoController.text.toString(),
      pontos: pontosController.text.toString(),
      publicoPrevistorvisto: publicoPrevistoController.text.toString(),
      solicitante: solicitanteController.text.toString(),
      tema: valueTema.toString(),
      timeInicio: controllerTimeInicio.text.toString(),
      timeTermino: controllerTimeTermino.text.toString(),
      treinamento: valueTreinamento.toString(),
    );

    adicionarEvento(evento);
    loadEventos();
    lojaController.clear();
    dateCalendarioFormat.clear();
    cargaHorariaController.clear();
    controllerTimeTermino.clear();
    limiteIncricoesController.clear();
    observacaoController.clear();
    pontosController.clear();
    publicoPrevistoController.clear();
    solicitanteController.clear();
    controllerTimeInicio.clear();
    notifyListeners();
  }

//Stepper
/////////////////////////////////////////////////////////////////
  continueStep() {
    if (currentStep < 4) {
      currentStep = currentStep + 1;
      notifyListeners();
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      currentStep = currentStep - 1;
      notifyListeners();
    }
  }

  onStepTapped(int value) {
    currentStep = value;
    notifyListeners();
  }

  verificacaoStep(context, details) {
    if (currentStep == 0) {
      controlLocal(context, details);
    } else if (currentStep < 3) {
      controlConcluir(context, details);
    } else {
      controlConcluir(context, details);
    }
  }

  AgendamentoStore() {
    selectedDate = diaFocado;
    selectedDate = DateTime.now();
    databaseHelper = DatabaseHelper();
  }

  Widget controlLocal(context, details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              if (globalKey.currentState!.validate()) {
                details.onStepContinue();
              }
            },
            child: const Text('Proximo'),
          ),
        ],
      ),
    );
  }

  Widget controlBuilders(context, details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              if (globalKeyTreinamento.currentState!.validate() &&
                  globalKeySolicitante.currentState!.validate() &&
                  globalKeyBusinessCenter.currentState!.validate() &&
                  globalKeyDataInicio.currentState!.validate() &&
                  globalKeyDataTermino.currentState!.validate()) {
                details.onStepContinue();
              }
            },
            child: const Text('Proximo'),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: details.onStepCancel,
            child: const Text('Voltar'),
          ),
        ],
      ),
    );
  }

  Widget controlConcluir(context, details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              currentStep = 0;

              addEvent();
              ScarfoldMessage.show(
                  context, "Agendamento adicionado com sucesso");

              Navigator.pop(context);
            },
            child: const Text('Concluir'),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: details.onStepCancel,
            child: const Text('Voltar'),
          ),
        ],
      ),
    );
  }
}
