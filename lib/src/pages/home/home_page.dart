import 'package:et_lab_clinica_adm/src/pages/home/home_controller.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final deskNumberEC = TextEditingController();
  final controller = Injector.get<HomeController>();

  @override
  void initState() {
    messageListener(controller);
    super.initState();
  }

  @override
  void dispose() {
    deskNumberEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicaAppBar(),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(40),
        width: sizeOf.width * .4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: LabClinicaTheme.orangeColor)),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Bem Vindo(a)!',
                style: LabClinicaTheme.titleStyle,
              ),
              const SizedBox(height: 32),
              const Text(
                'Preencha o número do guichê que você está atendendo!',
                style: LabClinicaTheme.subTitleSmallStyle,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: deskNumberEC,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: Validatorless.multiple([
                  Validatorless.required('Guichê Obrigatório'),
                  Validatorless.number('Guichê deve conter apenas número'),
                ]),
                decoration:
                    const InputDecoration(label: Text('Número do guichê')),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    final valid = formKey.currentState?.validate() ?? false;
                    if (valid) {
                      controller.startService(int.parse(deskNumberEC.text));
                    }
                  },
                  child: const Text('CHAMAR PRÓXIMO PACIENTE'),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
