import 'package:et_lab_clinica_adm/src/pages/end_checkin/end_checkin_controller.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

class EndCheckinPage extends StatefulWidget {
  const EndCheckinPage({super.key});

  @override
  State<EndCheckinPage> createState() => _EndCheckinPageState();
}

class _EndCheckinPageState extends State<EndCheckinPage> with MessageViewMixin {
  final controller = Injector.get<EndCheckinController>();

  @override
  void initState() {
    messageListener(controller);

    effect(
      () {
        if (controller.informationForm() != null) {
          Navigator.of(context).pushReplacementNamed(
            '/pre-checkin',
            arguments: controller.informationForm(),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicaAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 56),
          padding: const EdgeInsets.all(40),
          width: sizeOf.width * .4,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicaTheme.orangeColor)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/check_icon.png'),
              const SizedBox(height: 40),
              const Text(
                'Atendimento finalizado com sucesso!',
                style: LabClinicaTheme.titleSmallStyle,
              ),
              const SizedBox(height: 80),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    controller.callNextpatient();
                  },
                  child: const Text('CHAMAR OUTRA SENHA'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
