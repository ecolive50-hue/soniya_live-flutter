import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  final int seat;
  final bool occupied;
  final bool locked;
  final bool isHost;

  final VoidCallback onTap;
  final VoidCallback? onKick;
  final VoidCallback? onMute;
  final VoidCallback? onLock;

  const SeatWidget({
    super.key,
    required this.seat,
    required this.occupied,
    required this.locked,
    required this.isHost,
    required this.onTap,
    this.onKick,
    this.onMute,
    this.onLock,
  });

  void _showHostMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (occupied)
            ListTile(
              leading: const Icon(Icons.volume_off),
              title: const Text("Mute User"),
              onTap: onMute,
            ),
          if (occupied)
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Kick User"),
              onTap: onKick,
            ),
          ListTile(
            leading: Icon(locked ? Icons.lock_open : Icons.lock),
            title: Text(locked ? "Unlock Seat" : "Lock Seat"),
            onTap: onLock,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: isHost ? () => _showHostMenu(context) : null,
      child: Container(
        decoration: BoxDecoration(
          color: locked
              ? Colors.grey.shade800
              : occupied
                  ? Colors.green
                  : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: locked
              ? const Icon(Icons.lock, color: Colors.white)
              : occupied
                  ? const Icon(Icons.mic, color: Colors.white)
                  : Text(
                      "Seat $seat",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
        ),
      ),
    );
  }
}