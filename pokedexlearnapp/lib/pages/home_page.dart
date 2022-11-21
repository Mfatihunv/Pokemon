import 'package:flutter/material.dart';
import 'package:pokedexlearnapp/widgets/apptitle.dart';
import 'package:pokedexlearnapp/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTitle(),
          Expanded(child: PokemonList()),
        ],
      ),
    );
  }
}
