
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/providers/state_providers.dart';
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


class ProviderMainScreen extends ConsumerWidget{
  const ProviderMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrlValue = ref.watch(cityImageProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Provider Screen',),
      body: imageUrlValue != null ? _buildImage(context, imageUrlValue): const Center(child: Text('No image found'),)
    );
  }

  Widget _buildImage(BuildContext context, String image){
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.network(image, 
      fit: BoxFit.cover,),
    );
  }
}