import 'package:cinemapedia_flutter_app/presentation/providers/providers.dart';
import 'package:cinemapedia_flutter_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideshowMovies = ref.watch(moviesSlideshowProvider);
    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideShow(movies: slideshowMovies),
        MovieHorizontalListview(
          movies: nowPlayingMovies,
          title: 'En cines',
          subtitle: 'Lunes 20',
          loadNextPage: () {
            ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
          },
        ),
      ],
    );
  }
}
