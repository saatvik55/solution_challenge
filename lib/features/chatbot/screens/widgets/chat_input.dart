import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
class PChatInput extends StatefulWidget {
  final Function(String) onSendMessage; // Callback function to send messages

  const PChatInput({super.key, required this.onSendMessage});

  @override
  State<PChatInput> createState() => _PChatInputState();
}

class _PChatInputState extends State<PChatInput> {
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: "Type message",
                hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.battleship),
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Iconsax.arrow_circle_right,size: 30,color: dark ? TColors.brightpink : TColors.rani,),
            onPressed: () {
              String message = messageController.text.trim();
              if (message.isNotEmpty) {
                widget.onSendMessage(message); // Call the callback function with the message
                messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}