import 'package:cust_hackerman/Models/screen_arguments.dart';
import 'package:cust_hackerman/Widgets/FoodCardScrollBar/FoodCard.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:cust_hackerman/Models/foodbase.dart';

class SearchBox extends StatefulWidget implements PreferredSizeWidget{
  @override
  _SearchBoxState createState() => _SearchBoxState();

  @override
  Size get preferredSize => new Size.fromHeight(60);
}

class _SearchBoxState extends State<SearchBox> {

  //Save past search history up to five
  static const historyListLength = 5;

  List<String> _searchHistory = [];

  List<String> filteredSearchHistory;

  String selectedWordings;

  List<String> filteredItems({@required String wordings}){
    if(wordings != null && wordings.isNotEmpty){
      return _searchHistory.reversed.where((element) => element.startsWith(wordings)).toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void deleteOldestEntry(String delement){
    _searchHistory.removeWhere((term) => term == delement);
    filteredSearchHistory = filteredItems(wordings: null);
  }

  void reorderSearchHistory(String relement){
    deleteOldestEntry(relement);
    updateSearchWordings(relement);
  }

  void updateSearchWordings(String uelement){
    if(_searchHistory.contains(uelement)){
      reorderSearchHistory(uelement);
      return;
    }
    _searchHistory.add(uelement);
    if(_searchHistory.length > historyListLength){
      _searchHistory.removeRange(0, _searchHistory.length-historyListLength);
    }
    filteredSearchHistory = filteredItems(wordings: null);
  }

  FloatingSearchBarController _searchBarController;

  @override
  void initState() {
    super.initState();
    _searchBarController = FloatingSearchBarController();
    filteredSearchHistory = filteredItems(wordings: null);
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      automaticallyImplyBackButton: false,
      clearQueryOnClose: false,
      closeOnBackdropTap: true,
      width: MediaQuery.of(context).size.width*0.75,
      transition: ExpandingFloatingSearchBarTransition(),
      physics: ClampingScrollPhysics(),
      title: Text(selectedWordings ?? 'Search',),
      hint: 'What kind of food are you looking for?',
      controller: _searchBarController,
      actions: [
        FloatingSearchBarAction.searchToClear()
      ],
      onQueryChanged: (query){
        setState(() {
          filteredSearchHistory = filteredItems(wordings: query);
        });
      },
      onSubmitted: (query){
        setState(() {
          updateSearchWordings(query);
          selectedWordings = query;
        });
        _searchBarController.close();
        Navigator.pushNamed(context, '/searchresult', arguments: ScreenArguments(name: query));
      },
      builder: (ctx, transition){
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Material(
            color: Colors.white,
            elevation: 4,
            child: Builder(
              builder: (context){
                if(filteredSearchHistory.isEmpty && _searchBarController.query.isEmpty){
                  return Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width*0.75,
                    alignment: Alignment.center,
                    child: Text(
                      "Start Searching",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  );
                } else if(filteredSearchHistory.isEmpty){
                  return ListTile(
                    title: Text(_searchBarController.query),
                    leading: const Icon(Icons.search_outlined),
                    onTap: (){
                      setState(() {
                        updateSearchWordings(_searchBarController.query);
                        selectedWordings = _searchBarController.query;
                      });
                      _searchBarController.close();
                    },
                  );
                } else{
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: filteredSearchHistory.map((e) => ListTile(
                      title: Text(e, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      leading: const Icon(Icons.history_outlined),
                      trailing: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: (){
                          setState(() {
                            deleteOldestEntry(e);
                          });
                        }, 
                      ),
                      onTap: (){
                        setState(() {
                          reorderSearchHistory(e);
                          selectedWordings = e;
                        });
                        _searchBarController.close();
                      },
                    )).toList(),
                  );
                }
              },),
          ),
        );
      },
    );
  }
}

// Center(
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.75,
//         child: FlexibleSpaceBar(
//           centerTitle: true,
//           title: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               textInputAction: TextInputAction.done,
//               cursorColor: Colors.black,
//               controller: widget._searchtxt,
//               decoration: InputDecoration(
//                   hintText: 'What kind of food are you searching?'),
//               onSubmitted: (_){
//                 Navigator.pushNamed(context, '/shopinfo');
//               },
//             ),
//           ),
//         ),
//       ),
//     );
