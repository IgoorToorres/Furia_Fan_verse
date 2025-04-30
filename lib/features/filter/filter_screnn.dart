import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fuira_fan_verse/core/models/notification_filter.dart';
import 'package:fuira_fan_verse/data/filter_data.dart';
import 'package:fuira_fan_verse/shared/app_colors.dart';
import 'package:fuira_fan_verse/shared/widgets/appbar_default.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late Map<String, bool> _filters;

  @override
  void initState() {
    super.initState();
    final current = Provider.of<FilterData>(context, listen: false).currentFilter;
    _filters = {
      'CS': current.cs,
      'Kings League': current.kingsLeague,
      'Valorant': current.valorant,
      'LoL': current.lol,
      'Rainbow Six': current.r6,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarDefault(),
      backgroundColor: AppColors.backgroundLight,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Escolha seus jogos preferidos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Esses filtros serão usados para personalizar suas notificações e conteúdos no app.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: _filters.entries.map((entry) {
                  return Card(
                    elevation: 2,
                    color: AppColors.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: CheckboxListTile(
                      title: Text(
                        entry.key,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textCardColor,
                        ),
                      ),
                      value: entry.value,
                      onChanged: (newValue) {
                        setState(() {
                          _filters[entry.key] = newValue ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.textCardColor,
                      checkColor: AppColors.cardColor,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    final newFilter = NotificationFilter.fromMap(_filters);
                    Provider.of<FilterData>(context, listen: false)
                        .updateFilter(newFilter);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Aplicar Filtros',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.textCardColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
