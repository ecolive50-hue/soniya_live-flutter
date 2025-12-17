itemBuilder: (_, i) {
  final userIdOnSeat = seats[i];

  return SeatWidget(
    seat: i + 1,
    occupied: userIdOnSeat != null,
    locked: locked[i],
    isHost: widget.isHost,
    onTap: () => onSeatTap(i),

    onKick: widget.isHost && userIdOnSeat != null
        ? () {
            socket.socket.emit("kick-user", {
              "roomId": widget.roomId,
              "userId": userIdOnSeat,
            });
            Navigator.pop(context);
          }
        : null,

    onMute: widget.isHost && userIdOnSeat != null
        ? () {
            socket.socket.emit("mute-user", {
              "roomId": widget.roomId,
              "userId": userIdOnSeat,
            });
            Navigator.pop(context);
          }
        : null,

    onLock: widget.isHost
        ? () {
            socket.lockSeat(widget.roomId, i);
            Navigator.pop(context);
          }
        : null,
  );
},