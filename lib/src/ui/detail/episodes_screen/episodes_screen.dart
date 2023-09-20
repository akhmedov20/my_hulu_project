import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/apimodels/tvDetail/tv_detail_model.dart';
import 'package:hulu/src/bloc/tvDetail/tvDetail_bloc.dart';
import 'package:hulu/src/widgets/episode_widget/episode_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/utils.dart';
import '../../../widgets/textstyle/textstyle_widget.dart';

class EpisodesScreen extends StatefulWidget {
  final int id;
  const EpisodesScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  @override
  void initState() {
    tvDetailbloc.getTrending(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return StreamBuilder<TvDetailModel>(
      stream: tvDetailbloc.getTvDetail,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          var data = snapshot.data;
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 5 * h,bottom: 5 * h),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15 * w),
                    child: Column(
                      children: [
                        SizedBox(height: 20 * h,),
                        Text(data!.overview.toString(),style: GoogleFonts.montserrat(
                          textStyle: AppStyle.ten(Colors.white)
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(height: 35 * h,),
                  SizedBox(
                    height: 500 * h,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                        itemCount: widget.id.bitLength,
                        itemBuilder: (context,index){
                          return  EpisodeWidget(img: "https://image.tmdb.org/t/p/w500/${data!.seasons![index].posterPath}",
                              presTap: (){}, downloadTap: (){}, S: data.seasons![index].seasonNumber!,
                              E1: data.seasons![index].seasonNumber!, episodeName: data.seasons![index].name!,
                              overview: data.seasons![index].overview!, rating: data.seasons![index].voteAverage!);
                        }),
                  )
                ],
              ),

            ),
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
