#! /usr/bin/awk -f
BEGIN{
  move=-1
  cells="1 2 3 4 5 6 7 8 9"
  split(cells,cell," ")
  print "Hello! Welcome to the game!"
  print_board()
  print "You have to choose one cell, where you want to put your X or O."
  print "The cell you have to choose is by the cell number given above."
  printf "Player-1, enter your name : "
  getline player_1
  printf "Player-2, enter your name : "
  getline player_2
  player=player_1
  printf player_1", enter your choice of symbol ( O / X ) : "
};

($0=="O" || $0=="o"){
  p1="O"
  p2="X"
  print player_1" -> "p1" , "player_2" -> "p2
  p=p1
  move++
  printf player", enter your choice of cell : "
  next
};

($0=="x" || $0=="X"){
  p1="X"
  p2="O"
  print player_1" -> "p1" , "player_2" -> "p2
  p=p1
  move++
  printf player", enter your choice of cell : "
  next
};

($0>=1 && $0<=9 && move>=0){
  if(cell[$0]!=p1 && cell[$0]!=p2){
    cell[$0]=p 
    print_board()
    checking()
    move++
    if(move%2==0){
      player=player_1
      p=p1
    }
    else{
      player=player_2
      p=p2
    }
  }
  else{
    print "Sorry! This cell is already occupied. Try again."
  }
  printf player", enter your choice of cell : "
  next
};

{
  if(move==-1) printf "Sorry! Wrong choice!"player_1", enter your choice of symbol ( O / X ) : "
  if(move>=0) printf "Sorry! Wrong input! "player", enter your choice of cell : "
};
function print_board(){
  print "   |   |   "
  print " "cell[1]" | "cell[2]" | "cell[3]
  print "   |   |   "
  print "---|---|---"
  print "   |   |   "
  print " "cell[4]" | "cell[5]" | "cell[6]
  print "   |   |   "
  print "---|---|---"
  print "   |   |   "
  print " "cell[7]" | "cell[8]" | "cell[9]
  print "   |   |   "
  return
};

function checking(){
  if(move == 8){
    print "Draw."
    exit
  }
  win=0
  for(i=1;i<4;i++){
   if(cell[i]==cell[i+3] && cell[i+3]==cell[i+6])
      win=1
      break
  }
  for(i=1;i<8;i+=3){
    if(cell[i]==cell[i+1] && cell[i+1]==cell[i+2])
      win=1
      break
  }
  if(cell[1]==cell[5] && cell[5]==cell[9]) win=1
  if(cell[3]==cell[5] && cell[5]==cell[7]) win=1
  if(win==1){ 
    print player" win."
    exit
  }
  return
};

END{
  print "Game over."
};
