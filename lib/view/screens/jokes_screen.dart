import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/models/joke_model.dart';
import 'package:learn_flutter/providers/jokes_provider.dart';
import 'package:learn_flutter/widgets/appbar.dart';

class JokesScreen extends ConsumerStatefulWidget {
  const JokesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JokesScreenState();
}

class _JokesScreenState extends ConsumerState<JokesScreen> {
  final ScrollController _scrollController = ScrollController();
  List<Joke> _jokes = [];
  bool _isLoadingMore = false;
  int _currentPage = 1;
  final int _limit = 20;
  final String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchJokes();
    });
  }

  void _scrollListener() {
    // This condition checks if the scroll position is at either the top or the bottom edge of the scrollable area. The atEdge property returns true if the scroll position is at either end.
    if (_scrollController.position.atEdge) {
//       If pixels == 0, the user is at the very top of the list, and the function does nothing.
//       If pixels != 0, the user is at the bottom edge, and the function triggers loading more data.
      if (_scrollController.position.pixels != 0) {
        _fetchMoreJokes();
      }
    }
  }

  Future<void> _fetchJokes() async {
    final params = {'page': _currentPage, 'limit': _limit, 'searchTerm': _searchTerm};
    final jokesAsyncValue = await ref.read(jokesProvider(params).future);
    setState(() {
      _jokes = jokesAsyncValue.results!;
    });
  }

  Future<void> _fetchMoreJokes() async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    _currentPage++;
    final params = {'page': _currentPage, 'limit': 10, 'searchTerm': _searchTerm};
    final jokesAsyncValue = await ref.read(jokesProvider(params).future);

    setState(() {
      _isLoadingMore = false;
      _jokes.addAll(jokesAsyncValue.results!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Jokes',
      ),
      body: _buildJokesWidget(),
    );
  }

  Widget _buildJokesWidget() {
    if (_jokes.isEmpty && !_isLoadingMore) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: _jokes.length + 1, // Add one more item for the loading indicator
      itemBuilder: (context, index) {
        if (index == _jokes.length) {
          // Show loading indicator at the bottom
          return _isLoadingMore
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox.shrink();
        }
        final joke = _jokes[index];
        return ListTile(
          leading: Text(
            '${(index + 1).toString()}.',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          title: Text(joke.joke ?? 'No joke available'),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
