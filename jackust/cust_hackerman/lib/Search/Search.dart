 class SearchRes{
  final String path;
  final dynamic argument;
  SearchRes({this.path,this.argument});
 }
dynamic Search(String lang,String searchtext){
  String result;
  if(lang=="English"){
    Map m=new Map();
    m['title']='sample name';
    m['imgPath']='/cctbreakfast/1.jpg';
    return SearchRes(path:'/foodtemplate2_frommap',argument: m);
  }
  else {
    return SearchRes(path:'/searchresult',argument: List.filled(10,List.filled(2, 'asdsad')));
  }
}
