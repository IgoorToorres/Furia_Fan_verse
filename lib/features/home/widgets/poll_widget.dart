import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:fuira_fan_verse/shared/app_colors.dart';

class PollWidget extends StatefulWidget {
  const PollWidget({super.key});

  @override
  State<PollWidget> createState() => _PollWidgetState();
}

class _PollWidgetState extends State<PollWidget> {
  bool hasVoted = false;
  String selectedPollOption = '1'; // ← agora é String

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FlutterPolls(
        votesTextStyle: TextStyle(
          color: AppColors.textColor,
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
          return true;
        },
        pollTitle: const Text(
          'Quem jogou melhor ontem?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor, 
          ),
        ),
        votedProgressColor: Colors.green, 
        // votedBackgroundColor: Colors.grey.shade700, 
        votedBackgroundColor: AppColors.cardColor, 
        votedPercentageTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        pollOptions: [
          PollOption(
            id: '1',
            title: const Text(
              'Fallen',
              style: TextStyle(color: Colors.white),
            ),
            votes: 67,
          ),
          PollOption(
            id: '2',
            title: const Text(
              'Yuurih',
              style: TextStyle(color: Colors.white),
            ),
            votes: 22,
          ),
          PollOption(
            id: '3',
            title: const Text(
              'Yekindar',
              style: TextStyle(color: Colors.white),
            ),
            votes: 34,
          ),
          PollOption(
            id: '4',
            title: const Text(
              'Kscerato',
              style: TextStyle(color: Colors.white),
            ),
            votes: 67,
          ),
          PollOption(
            id: '5',
            title: const Text(
              'molodoy',
              style: TextStyle(color: Colors.white),
            ),
            votes: 34,
          ),
        ],
        pollOptionsFillColor: AppColors.cardColor,
        pollOptionsBorder: Border.all(color: AppColors.backgroundLight),
      ),
    );
  }
}
