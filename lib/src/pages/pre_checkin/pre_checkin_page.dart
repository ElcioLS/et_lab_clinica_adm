import 'package:et_lab_clinica_adm/src/shared/data_item.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter/material.dart';

class PreCheckinPage extends StatelessWidget {
  const PreCheckinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicaAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.sizeOf(context).width * .5,
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.only(top: 56),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: LabClinicaTheme.orangeColor,
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/patient_avatar.png',
                ),
                const SizedBox(height: 16),
                const Text(
                  'A Senha Chamada foi:',
                  style: LabClinicaTheme.titleSmallStyle,
                ),
                const SizedBox(height: 16),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  width: 218,
                  decoration: BoxDecoration(
                    color: LabClinicaTheme.orangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Rodrigo Rahman',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                const DataItem(
                  label: 'Nome Paciente',
                  value: 'Rodrigo Rahman',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'E-mail',
                  value: 'elcinho@gmail.com',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'Telefone',
                  value: '3232323',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'CPF',
                  value: '3232',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'CEP',
                  value: '4343543',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'Endereço',
                  value: 'Rasasaodrigo asasRahman',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'Responsável',
                  value: 'Rodrigo Rahman',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'Documento de indentificação',
                  value: 'Rodrigo Rahman',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size.fromHeight(48)),
                          onPressed: () {},
                          child: const Text('CHAMAR OUTRA SENHA')),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromHeight(48)),
                            onPressed: () {},
                            child: const Text('ATENDER')))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
