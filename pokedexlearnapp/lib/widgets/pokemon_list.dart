import 'package:flutter/material.dart';

import '../model/pokemon_model.dart';
import '../servlces/pokedex.api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _listem = snapshot.data!;

          return ListView.builder(
            itemCount: _listem.length,
            itemBuilder: (context, index) {
              var oankipokemon = _listem[index];
              return ListTile(
                title: Text(oankipokemon.name.toString()),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('hata var knk'),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
