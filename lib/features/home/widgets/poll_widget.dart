import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';

class PollWidget extends StatefulWidget {
  const PollWidget({super.key});

  @override
  State<PollWidget> createState() => _PollWidgetState();
}

class _PollWidgetState extends State<PollWidget> {
  bool hasVoted = false;
  String selectedPollOption = '1';

  void _showPointsAnimation(BuildContext context) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          left: MediaQuery.of(context).size.width * 0.2,
          right: MediaQuery.of(context).size.width * 0.2,
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: -100),
                duration: const Duration(seconds: 2),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, value),
                    child: Opacity(
                      opacity: 1 - (value.abs() / 100),
                      child: child,
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/furia-coin.png',
                      height: 50,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '+10',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFD700), // dourado
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FlutterPolls(
                pollTitle: const Text(
                  'Quem jogou melhor ontem?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                votesTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                pollId: '001',
                hasVoted: hasVoted,
                userVotedOptionId: selectedPollOption,
                onVoted: (PollOption option, int _) async {
                  setState(() {
                    hasVoted = true;
                    selectedPollOption = option.id!;
                  });

                  _showPointsAnimation(context); // Mostra animação

                  return true;
                },
                votedProgressColor: Colors.greenAccent.shade400,
                votedBackgroundColor: Colors.grey.shade400,
                votedPercentageTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                pollOptionsFillColor: Colors.black87,
                pollOptionsBorder: Border.all(color: Colors.transparent),
                pollOptions: [
                  PollOption(
                    id: '1',
                    title: const Text(
                      'Fallen',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    votes: 67,
                  ),
                  PollOption(
                    id: '2',
                    title: const Text(
                      'Yuurih',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    votes: 22,
                  ),
                  PollOption(
                    id: '3',
                    title: const Text(
                      'Yekindar',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    votes: 34,
                  ),
                  PollOption(
                    id: '4',
                    title: const Text(
                      'Kscerato',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    votes: 67,
                  ),
                  PollOption(
                    id: '5',
                    title: const Text(
                      'molodoy',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    votes: 34,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.how_to_vote,
                      size: 16, color: Colors.black54),
                  const SizedBox(width: 6),
                  const Text(
                    '224 votos',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
