import 'package:flutter/material.dart';

import '../widgets/articulo_card.dart';

import 'package:provider/provider.dart';
import '../providers/article_provider.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ArticleProvider(),
      child:
          const ArticleScreen(), // Asegurar que ArticleScreen tenga acceso al provider
    );
  }
}

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Artículos"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Consumer<ArticleProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: provider.searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar Producto...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: Consumer<ArticleProvider>(
        builder: (context, provider, child) {
          const double itemWidth = 250;
          int crossAxisCount;

          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= itemWidth * 3) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth >= 500) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 1;
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 4,
                ),
                itemCount: provider.filteredProducts.length,
                itemBuilder: (context, index) {
                  return ArticuloCard(
                      producto: provider.filteredProducts[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
