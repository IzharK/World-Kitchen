import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:world_kitchen/presentation/providers/countries_provider.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('World Kitchen'), centerTitle: true),
      body: Consumer<CountriesProvider>(
        builder: (context, provider, _) {
          return provider.state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (areas) => ListView.builder(
              itemCount: areas.length,
              itemBuilder: (context, index) {
                final area = areas[index];
                return ListTile(
                  title: Text(area.name),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () => context.push('/recipes/${area.name}'),
                );
              },
            ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $message'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<CountriesProvider>().loadAreas(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
