import 'dart:io';
import 'dart:typed_data';
import 'package:social_share/social_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:fuira_fan_verse/shared/app_colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class PollWidget extends StatefulWidget {
  const PollWidget({super.key});

  @override
  State<PollWidget> createState() => _PollWidgetState();
}

class _PollWidgetState extends State<PollWidget> {
  bool hasVoted = false;
  String selectedPollOption = '1';

  Future<void> shareToInstagramStory(Uint8List imageBytes) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/furia_story.png');
    await file.writeAsBytes(imageBytes);

    try {
      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'Votei no FalleN!',
        text: 'Votei no FalleN! #FURIA #Esports',
      );
    } catch (e) {
      print("Erro ao compartilhar: $e");
    }
  }

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
              color: Colors.black.withAlpha((0.05 * 255).toInt()),
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
                votedProgressColor: AppColors.lightBackgroundColor,
                votedBackgroundColor: AppColors.cardColor,
                votedPercentageTextStyle: const TextStyle(
                  color: AppColors.textCardColor,
                  fontSize: 12,
                ),
                pollOptionsFillColor: AppColors.cardColor,
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
              if (hasVoted) ...[
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () async {
                    final ByteData imageData =
                        await DefaultAssetBundle.of(context)
                            .load('assets/logo-furia.png');
                    final Uint8List bytes = imageData.buffer.asUint8List();

                    final tempDir = await getTemporaryDirectory();
                    final file = File('${tempDir.path}/story.png');
                    await file.writeAsBytes(bytes);

                    SocialShare.shareInstagramStory(
                      file.path, // imagePath é posicional
                      backgroundTopColor: "#000000",
                      backgroundBottomColor: "#000000",
                      attributionURL: "https://furia.gg",
                    );
                  },
                  icon: const Icon(
                    Icons.share,
                    color: AppColors.textCardColor,
                  ),
                  label: const Text('Compartilhar nos Stories'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.cardColor,
                    foregroundColor: AppColors.textCardColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
