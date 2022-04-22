import 'package:conversor_moeda/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel? selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel? model) onChanged;

  const CurrencyBox(
      {Key? key,
      required this.controller,
      required this.items,
      required this.onChanged,
      required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          //preencher o espaço disponivel
          flex: 1, //usa um espaço da tela
          child: SizedBox(
            height: 65, //distancia entre os flex
            child: DropdownButton<CurrencyModel>(
              // pegar os intems da classe model
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              value: selectedItem,
              underline: Container(
                height: 1, //tamanho da borda
                color: Colors.amber,
              ),
              items: items
                  .map((e) => DropdownMenuItem<CurrencyModel>(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2, //usa dois espaço da tela
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 11, 150, 138)))),
          ),
        ),
      ],
    );
  }
}
