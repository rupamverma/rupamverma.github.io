 var ticTacBoard;
		var huPlayer = 'O';
		var aiPlayer = 'X';
		var human = $("#btn1").html();
		var computer = $("#btn2").html();
		$(document).ready(function(){
		  $(".btn-btn").click(function(x){
		    $("#tic-tac-toe").fadeIn(1000);
		    x = $(this).html();
		    if (x==human){
		      huPlayer = human;
		      aiPlayer = computer;
		      $("#select-board").hide();
		    }else{
		      huPlayer = computer;
		      aiPlayer = human;
		      $("#select-board").hide();
		    }
		  })
		})
		var win_case = [
		  	[0,1,2],
		  	[3,4,5],
		  	[6,7,8],
		  	[0,3,6],
		  	[1,4,7],
		  	[2,5,8],
		  	[0,4,8],
		  	[6,4,2]
		];
		const cells = document.querySelectorAll('.cell');
		 gameStart();
		function gameStart(){
		  $("#tic-tac-toe").hide();
		  $("#select-board").fadeIn(1000);
		  document.querySelector(".game-end").style.display = "none";
		  ticTacBoard = Array.from(Array(9).keys());
		 
		  for(var i=0;i<cells.length;i++){
		    cells[i].innerText = " ";
		    cells[i].style.removeProperty("background-color");
		    cells[i].addEventListener('click' , clickBoard , false);
		  }
		}
		function clickBoard(square){
		  if (typeof ticTacBoard[square.target.id] =='number'){
		    myTurn(square.target.id,huPlayer);
		if (!checkWin(ticTacBoard, huPlayer) && !gameTie()) myTurn(bestTurn(), aiPlayer);
		  }
		  
		}
		function myTurn(squareId,player){
		  ticTacBoard[squareId] = player;
		  document.getElementById(squareId).innerText = player;
		  var gameWon = checkWin(ticTacBoard,player);
		  	      	if (gameWon) gameOver(gameWon);
		  }
		 function checkWin(board, player){
		    var played = board.reduce((a,e,i) => (e===player) ? a.concat(i) : a, []);
		  	 var gameWon = null;
		     for(var [index , win] of win_case.entries()){
		      if (win.every(elem => played.indexOf(elem)>-1)){
		  	 gameWon = {index:index,player:player};
		  	      break;
		  	        		}
		  	        	}
		  	        	return gameWon;
		  	        }
		  function gameOver(gameWon){
		  	 for(var index of win_case[gameWon.index]){
		  	   document.getElementById(index).style.backgroundColor = 
		  	     gameWon.player == huPlayer ? "blue" : "red";
		      }
		  	   for(var i=0;i<cells.length;i++){
		  	        		cells[i].removeEventListener('click' , clickBoard , false);
		  	        	}
		  	     	declareWinner(gameWon.player == huPlayer ? "You Win" : "You lose");
		   }   
		   
		function declareWinner(check){
		  document.querySelector(".game-end").style.display = "block";
		  document.querySelector(".game-end .text").innerText = check;
		}
		 function emptyBox(){
		   return ticTacBoard.filter(s=> typeof s=='number');
		 }
		 function bestTurn(){
		   return minimax(ticTacBoard,aiPlayer).index;
		 }
		function gameTie(){
			var count=0;
		  if (emptyBox().length==0){
		    for(var i=0;i<cells.length;i++){
		      cells[i].style.backgroundColor="green";
		    }
		    declareWinner("Game Tie");
		     return true;
		  }
		    return false;
		}
		function minimax(newBoard,player){
		  var availBox = emptyBox(newBoard);
		  
		  if (checkWin(newBoard, huPlayer)) {
				return {score: -10};
			} else if (checkWin(newBoard, aiPlayer)) {
				return {score: 10};
			} else if (availBox.length===0) {
				return {score: 0};
			}
		  var moves = [];
		  for (var i=0; i<availBox.length; i++){
		  var move = {};
		  move.index = newBoard[availBox[i]];
		  newBoard[availBox[i]] = player;
		   
		  if (player == aiPlayer){
		  var result = minimax(newBoard,huPlayer);
		    move.score = result.score;
		    }
		  else{
		    var result = minimax(newBoard,aiPlayer);
		    move.score = result.score;
		    
		  }
		  newBoard[availBox[i]]= move.index;
		  moves.push(move);
		  }
		  var bestMove;
		  if (player===aiPlayer){
		    var bestScore = -1000;
		    for(var i=0;i<moves.length;i++){
		      if(moves[i].score > bestScore){
		        bestScore = moves[i].score;
		        bestMove = i;
		      }
		    }
		  }else {
		    var bestScore = 1000;
		    for(var i=0;i<moves.length;i++){
		      if (moves[i].score < bestScore){
		        bestScore = moves[i].score;
		        bestMove = i;
		   
		      }
		    }
		  }
		  return moves[bestMove];
		}
