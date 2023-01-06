import 'package:equatable/equatable.dart';

import '../models/movie.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();

  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  const SearchLoading();

  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<Movie> movies;
  const SearchLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}
