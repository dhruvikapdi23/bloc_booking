import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../flight_list/flight_list_cubit.dart';

part 'bags_selection_state.dart';

class BagsSelectionCubit extends Cubit<BagsSelectionState> {
  BagsSelectionCubit() : super(BagsSelectionInitial());

  int selectedUserIndex = 0,totalBags=0,totalLuggage=0;




  selectUser(index){
    selectedUserIndex = index;
    emit(BagsSelectionUpdate());
  }

  totalBagsLuggageMinus(context,FlightListCubit flight,{isBags = true}){
    if(isBags){
      totalBags = flight.userListData[selectedUserIndex]['totalBags'];

      if(totalBags >0){
        totalBags--;
      }else{
        totalBags =0;
      }
      flight.userListData[selectedUserIndex]['totalBags']=totalBags;
      emit(BagsSelectionUpdate());
      log("totalBags :$totalBags || ${flight.userListData[selectedUserIndex]['totalBags']}");
    }else{
      totalLuggage = flight.userListData[selectedUserIndex]['totalLuggage'];
      if(totalLuggage >0){
        totalLuggage--;
      }else{
        totalLuggage =0;
      }
      flight.userListData[selectedUserIndex]['totalLuggage']=totalLuggage;
      emit(BagsSelectionUpdate());
    }
  }

  totalBagsLuggagePlus(context,FlightListCubit flight,{isBags = true}){
    if(isBags){
      totalBags = flight.userListData[selectedUserIndex]['totalBags'];
      totalBags++;
      flight.userListData[selectedUserIndex]['totalBags']=totalBags;
      emit(BagsSelectionUpdate());
    }else{
      totalLuggage = flight.userListData[selectedUserIndex]['totalLuggage'];
      totalLuggage++;
      flight.userListData[selectedUserIndex]['totalLuggage']=totalLuggage;
      emit(BagsSelectionUpdate());
    }
  }
}
