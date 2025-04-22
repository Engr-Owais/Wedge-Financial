import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/networth_provider.dart';
import 'promo_card_widget.dart';

class PromoList extends StatefulWidget {
  const PromoList({super.key});

  @override
  State<PromoList> createState() => _PromoListState();
}

class _PromoListState extends State<PromoList> {
  final PageController _controller = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final int next = _controller.page?.round() ?? 0;
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NetWorthProvider>(context);

    switch (provider.state) {
      case PromoState.loading:
        return const Center(child: CircularProgressIndicator());
      case PromoState.error:
        return Center(child: Text('Error: ${provider.error}'));
      case PromoState.loaded:
        final promos = provider.promos;

        return SizedBox(
          height: 160,
          child: PageView.builder(
            controller: PageController(viewportFraction: 01),

            itemCount: 5,
            itemBuilder: (context, index) {
              final promo = promos[index];
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: PromoCard(
                  title: promo.header,
                  description: promo.content,
                  imageUrl: 'assets/image 111.png',
                  currentIndex: index,
                  totalDots: 5,
                ),
              );
            },
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
