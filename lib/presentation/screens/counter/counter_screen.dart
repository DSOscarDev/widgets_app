//counter_screen
// + Icons.add

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkmode = ref.watch(isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(            
            //icon: const Icon(Icons.light_mode_outlined),
            icon: Icon( isDarkmode? Icons.dark_mode_outlined:Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkmodeProvider.notifier).update((state) => !state);            
            },
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter',style:Theme.of(context).textTheme.titleLarge,),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),        
        onPressed: () {
          //primera alternativa
          ref.read(counterProvider.notifier).state++;
          // segunda alternativa
          // ref.read(counterProvider.notifier).update((state) => state+1);
        },
      ),
    );
  }
}