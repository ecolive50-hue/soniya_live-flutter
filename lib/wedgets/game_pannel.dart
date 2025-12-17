import 'dart:math';
import 'package:flutter/material.dart';

class GamePanel extends StatefulWidget {
  const GamePanel({super.key});

  @override
  State<GamePanel> createState() => _GamePanelState();
}

class _GamePanelState extends State<GamePanel> {
  int _diceValue = 1;

  void _rollDice() {
    setState(() {
      _diceValue = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          const Text(
            "Mini Game 🎮",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // 🎲 Dice Display
          Text(
            "🎲 $_diceValue",
            style: const TextStyle(fontSize: 48),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: _rollDice,
            child: const Text("Roll Dice"),
          ),
        ],
      ),
    );
  }
}