import 'package:flutter/material.dart';
import '../models/gift_model.dart';
import '../services/gift_service.dart';

class GiftBottomSheet extends StatelessWidget {
  final String roomId;
  final String fromUser;
  final String toUser;

  GiftBottomSheet({
    super.key,
    required this.roomId,
    required this.fromUser,
    required this.toUser,
  });

  final giftService = GiftService();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: demoGifts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (_, i) {
        final gift = demoGifts[i];
        return GestureDetector(
          onTap: () {
            giftService.sendGift(
              roomId: roomId,
              fromUser: fromUser,
              toUser: toUser,
              giftId: gift.id,
              price: gift.price,
            );
            Navigator.pop(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(gift.emoji, style: const TextStyle(fontSize: 30)),
              Text(gift.name),
              Text("${gift.price} 💰"),
            ],
          ),
        );
      },
    );
  }
}