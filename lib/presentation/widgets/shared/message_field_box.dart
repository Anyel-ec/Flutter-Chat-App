// import material package
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textControll = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );

    final inputDecoration = InputDecoration(
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      hintText: 'Escribe un mensaje',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      // icono de enviar
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textControll.value.text;
          print ('button: $textValue');
          textControll.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      focusNode: focusNode,
      controller : textControll,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit $value');
        textControll.clear();
        focusNode.requestFocus();
      },
    );
  }
}
