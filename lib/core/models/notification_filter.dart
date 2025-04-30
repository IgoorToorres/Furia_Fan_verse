class NotificationFilter {
  final bool cs;
  final bool kingsLeague;
  final bool valorant;
  final bool lol;
  final bool r6;

  NotificationFilter({
    required this.cs,
    required this.kingsLeague,
    required this.valorant,
    required this.lol,
    required this.r6,
  });

  factory NotificationFilter.fromMap(Map<String, bool> map) {
    return NotificationFilter(
      cs: map['CS'] ?? false,
      kingsLeague: map['Kings League'] ?? false,
      valorant: map['Valorant'] ?? false,
      lol: map['LoL'] ?? false,
      r6: map['Rainbow Six'] ?? false,
    );
  }

  Map<String, bool> toMap() {
    return {
      'CS': cs,
      'Kings League': kingsLeague,
      'Valorant': valorant,
      'LoL': lol,
      'Rainbow Six': r6,
    };
  }

  bool isGameEnabled(String game) {
    final normalized = {
      'cs': cs,
      'kings league': kingsLeague,
      'valorant': valorant,
      'lol': lol,
      'r6': r6,
    };
    return normalized[game.toLowerCase()] ?? false;
  }
}
