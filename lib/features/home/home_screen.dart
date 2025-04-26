import 'package:flutter/material.dart';
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
    final List<String> partnersImages = Partners().getImages();
    return Center(
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        drawer: CustomDrawer(),
        appBar: AppbarDefault(),
        body: FutureBuilder(
          future: newsData.getNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('erro ao carregar noticias'));
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PollWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text(
                            'Tire suas duvidas\ncom o mascote da Furia!',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/furia-fc.png',
                              height: 100,
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
                          'Noticias',
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
                      child: Column(
                        spacing: 8,
                        children: List.generate(
                          10,
                          (index) {
                            return NewsCard(news: newsData.listNews[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
