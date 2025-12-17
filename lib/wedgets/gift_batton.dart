import 'package:flutter/material.dart';
import 'gift_bottom_sheet.dart';

class GiftButton extends StatelessWidget {
  final String roomId;
  final String fromUser;
  final String toUser;

  const GiftButton({
    super.key,
    required this.roomId,
    required this.fromUser,
    required this.toUser,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.card_giftcard, color: Colors.pink),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => GiftBottomSheet(
            roomId: roomId,
            fromUser: fromUser,
            toUser: toUser,
          ),
        );
      },
    );
  }
}