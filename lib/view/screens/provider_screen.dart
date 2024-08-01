import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter/widgets/appbar.dart';

// final helloWorldProvider = Provider<String>((_) => 'Hello world');

// class ProviderMainScreen extends ConsumerWidget {
//   const ProviderMainScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final helloWorld = ref.watch(helloWorldProvider);
//     return Center(
//         child: Text(
//       helloWorld,
//       style:
//           const TextStyle(color: Colors.white, decoration: TextDecoration.none),
//     ));
//   }
// }

// declare the provider
// final dateFormatterProvider = Provider<DateFormat>((ref) {
//   return DateFormat.MMMEd();
// });

// class ProviderMainScreen extends ConsumerWidget {
//   const ProviderMainScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // retrieve the formatter
//     final formatter = ref.watch(dateFormatterProvider);
//     // use it
//     return Text(formatter.format(DateTime.now()));
//   }
// }

// final counterStateProvider= StateProvider<int>((ref){
//   return 0;
// });

// class ProviderMainScreen extends ConsumerWidget{
//   const ProviderMainScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref){
//     final counter = ref.watch(counterStateProvider);
//     return Center(
//       child: ElevatedButton(child: Text('Value : $counter'),
//       onPressed: ()=> ref.read(counterStateProvider.notifier).state++),
//     );
//   }
// }

class Clock extends StateNotifier<DateTime> {
  Clock() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = DateTime.now();
    });
  }

  late final Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});

class ProviderMainScreen extends ConsumerWidget {
  const ProviderMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTime = ref.watch(clockProvider);
    final timeFormatted = DateFormat.Hms().format(currentTime);
    return Scaffold(
        appBar: const CustomAppBar(title: 'Provider',),
        body: Center(
          child: Text(
                timeFormatted,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
        ));
  }
}
