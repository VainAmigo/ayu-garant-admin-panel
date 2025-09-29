import 'package:ayu_admin_panel/components/cards/cards.dart';
import 'package:flutter/material.dart';

class AnlyticCardsRow extends StatelessWidget {
  const AnlyticCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: NumberCard(
            text: 'Всего полисов',
            number: '23 424',
            isSelected: false,
            isDot: false,
          ),
        ),
        Expanded(
          child: NumberCard(
            text: 'Купленые полиса',
            number: '123',
            isSelected: false,
            isDot: false,
          ),
        ),
        Expanded(
          child: NumberCard(
            text: 'Начислено балов',
            number: '2 323 234',
            isSelected: false,
            isDot: false,
          ),
        ),
      ],
    );
  }
}
