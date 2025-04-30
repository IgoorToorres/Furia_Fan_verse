import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/data/filter_data.dart';
import 'package:fuira_fan_verse/features/chatbot/chat_bot_screen.dart';
import 'package:fuira_fan_verse/shared/app_colors.dart';
import 'package:fuira_fan_verse/shared/widgets/appbar_default.dart';
import 'package:fuira_fan_verse/data/news_data.dart';
import 'package:fuira_fan_verse/features/home/widgets/news_card.dart';
import 'package:fuira_fan_verse/features/home/widgets/partner_card.dart';
import 'package:fuira_fan_verse/features/home/widgets/poll_widget.dart';
import 'package:fuira_fan_verse/shared/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:fuira_fan_verse/core/models/partners.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsData>(context);
    final filterData = Provider.of<FilterData>(context);
    final List<String> partnersImages = Partners().getImages();

    final filteredNews = newsData.listNews
        .where((news) => filterData.isEnabled(news.game.toLowerCase()))
        .toList();

    return Center(
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        drawer: CustomDrawer(),
        appBar: AppbarDefault(),
        body: newsData.listNews.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PollWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text(
                            'Tire suas dúvidas\ncom o mascote da Furia!',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatBotScreen(),
                                ),
                              );
                            },
                            child: AnimatedScale(
                              scale: 1.0,
                              duration: const Duration(milliseconds: 200),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'assets/furia-fc.png',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Fale agora!',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Parceiros',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          partnersImages.length,
                          (index) {
                            return PartnerCard(image: partnersImages[index]);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          'Notícias',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: filteredNews.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Nenhuma notícia encontrada com os filtros atuais.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          : Column(
                              children: filteredNews
                                  .map((news) => NewsCard(news: news))
                                  .toList(),
                            ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
