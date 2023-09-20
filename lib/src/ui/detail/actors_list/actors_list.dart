import 'package:flutter/material.dart';
import 'package:hulu/src/apimodels/actors_model/actors_model.dart';
import 'package:hulu/src/bloc/tv_actors_bloc/tv_actors_bloc.dart';
import 'package:hulu/src/widgets/tvActorsWidget/tv_actors_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/utils.dart';

class ActorsList extends StatefulWidget {
  final int id;
  const ActorsList({Key? key, required this.id}) : super(key: key);

  @override
  State<ActorsList> createState() => _ActorsListState();
}

class _ActorsListState extends State<ActorsList> {
  @override
  void initState() {
    tvActorsBloc.getTrending(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return StreamBuilder<TvActorsModel>(
      stream: tvActorsBloc.getTvActors,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          var data = snapshot.data!.cast;
          return Container(
            margin: EdgeInsets.only(top: 20 * h),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2.4 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: data!.length,
                itemBuilder: (BuildContext ctx, index) {
                  return TvActorsWidget(img: "https://image.tmdb.org/t/p/w500/${data[index].profilePath}",
                      text: data[index].name!);
                }),
          );
        }
        else{
          return Shimmer.fromColors(
              child: Container(
                color: Colors.grey,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              baseColor: Colors.grey,
              highlightColor: Colors.white10);
        }
      }
    );
  }
}
