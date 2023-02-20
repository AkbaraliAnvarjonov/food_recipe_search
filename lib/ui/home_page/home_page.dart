import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/food_bloc.dart';
import 'package:food_recipe/bloc/food_event.dart';
import 'package:food_recipe/bloc/food_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Foods")),
        body: BlocBuilder<FoodsBloc, FoodsState>(
          builder: (context, state) {
            var currentBloc = context.read<FoodsBloc>();
            if (state is GetFoodsInSuccessState) {
              return SizedBox(
                  height: 900,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.hits.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 120,
                            childAspectRatio: 1.1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) =>
                        ListTile(title: Text(state.hits[index].recipe.label)),
                  ));
            } else if (state is GetFoodsInProgressState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetFoodsInFailuryState) {
              return Text(state.error);
            } else {
              currentBloc.add(FetchSearchingFoods());
              return Container();
            }
          },
        ));
  }
}
