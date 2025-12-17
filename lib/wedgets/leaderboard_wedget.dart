import 'package:flutter/material.dart';
import '../services/socket_service.dart';

class LeaderboardWidget extends StatefulWidget {
  final String roomId;

  const LeaderboardWidget({super.key, required this.roomId});

  @override
  State<LeaderboardWidget> createState() => _LeaderboardWidgetState();
}

class _LeaderboardWidgetState extends State<LeaderboardWidget> {
  final socket = SocketService();
  Map<String, int> leaderboard = {};

  @override
  void initState() {
    super.initState();

    socket.socket.on("leaderboard-update", (data) {
      setState(() {
        leaderboard = Map<String, int>.from(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final list = leaderboard.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, i) {
        return ListTile(
          leading: CircleAvatar(
            child: Text("#${i + 1}"),
          ),
          title: Text(list[i].key),
          trailing: Text("${list[i].value} 💰"),
        );
      },
    );
  }
}