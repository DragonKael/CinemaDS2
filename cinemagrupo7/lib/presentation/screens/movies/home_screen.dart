import 'package:cinemagrupo7/presentation/providers/providers.dart';
import 'package:cinemagrupo7/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigation(),
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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topratedMoviesProvider.notifier).loadNextPage();
    ref.read(anotherMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(MoviesSliedshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topratedMovies = ref.watch(topratedMoviesProvider);
    final anotherMovies = ref.watch(anotherMoviesProvider);
    
    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MoviesSliedshow(movies: slideShowMovies),
            MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subtitle: 'lunes 20',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()),
            MovieHorizontalListview(
                movies: upcomingMovies,
                title: 'Proximamente',
                subtitle: 'Enero',
                loadNextPage: () =>
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage()),
            MovieHorizontalListview(
                movies: topratedMovies,
                title: 'Mejor puntuadas',
                subtitle: '',
                loadNextPage: () =>
                    ref.read(topratedMoviesProvider.notifier).loadNextPage()),
            MovieHorizontalListview(
                movies: popularMovies,
                title: 'Populares',
                subtitle: 'siempre',
                loadNextPage: () =>
                    ref.read(popularMoviesProvider.notifier).loadNextPage()),
            MovieHorizontalListview(
                movies: anotherMovies.sublist(3),
                title: 'Another +5',
                subtitle: '?????',                
                loadNextPage: () =>
                    ref.read(anotherMoviesProvider.notifier).loadNextPage()),
          ],
        );
      }, childCount: 1))
    ]);
  }
}
