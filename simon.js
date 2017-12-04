
  var userInput = [];
  var simonInput = [];
  const winCase = 20;
  var id,color;
  var score = 0;
  var strict = false;
  var error = false;
  var gameStart = false;
  var soundArr = [
  "https://s3.amazonaws.com/freecodecamp/simonSound1.mp3", //green
  "https://s3.amazonaws.com/freecodecamp/simonSound2.mp3", //red
  "https://s3.amazonaws.com/freecodecamp/simonSound3.mp3", //yellow 
  "https://s3.amazonaws.com/freecodecamp/simonSound4.mp3" //blue   
  ];

    $(document).ready(function(){
      $("#count").text("");
        $(".switch").click(function() {    
    gameStart = (gameStart == false) ? true : false;
    console.log(gameStart);
    if(gameStart) {
      $(".square").addClass("square-green");
      $(".inner-switch").addClass("inner-inactive");
      $(".switch").addClass("outer-active");
      $("#count").text("00")
    }
    else {
     $(".square").removeClass("square-green");
      $(".inner-switch").removeClass("inner-inactive");
      $(".switch").removeClass("outer-active");
      $("#count").text("");
    }   

    $("#start").click(function(){
        strict = false;
        error = false;
        score = 0;
        score++;
        userInput= [];
        simonInput = [];
        simonTurn();
        
      }) 
      $("#strict").click(function(){
        score = 0;
        score++;
        strict = true;
        userInput = [];
        simonInput = [];
        simonTurn();

      })
  })
      
      $(".touch").click(function(){
          id = $(this).attr("id");
          color = $(this).attr("class").split(" ")[1];
          userTurn();

      });
    
   
})
      function userTurn(){
      userInput.push(id);
    console.log(id+" "+color);
    console.log(userInput);
    addColorActive(id,color);
    if(!checkUserTurn()) {

      if(strict){
          console.log("strict");  
          simonInput = [];
          score = 1;
      }
      error = true;
        errorOccur();
        userInput = [];
        simonTurn();

       }

      else if(userInput.length==simonInput.length && userInput.length<winCase){
        score++;
        userInput = [];
        error = false;
        simonTurn();
      }
       if(userInput.length==win_case){
        gameWinner();
        resetGame();
       }
      }
         function checkUserTurn(){
          for(var i=0;i<userInput.length;i++){
            if(userInput[i] != simonInput[i]){
              return false;
            }
          }
          return true;
         }
            
  function errorOccur() {
  console.log("error");  
  var counter = 0;
  var myError = setInterval(function() {
    $("#count").text("!!");
    counter++;
    if(counter == 3) {
      $("#count").text(score);
      clearInterval(myError);
      userInput = [];
      counter = 0;
    }
  }, 500);
}


     function simonTurn(){
      $("#count").text(score);
      if(!error){
        getRandomNum();
      }
      if(error && strict){
        getRandomNum();
      }
      var i=0;
      var simonInterval = setInterval(function(){
          id = simonInput[i];
          color = $("#"+id).attr("class").split(" ")[1];
          console.log(id+" "+color);
          addColorActive(id,color);
          i++;
          if(i==simonInput.length){
            clearInterval(simonInterval);
          }
      },1000)
     }

      function getRandomNum(){
        var random = Math.floor(Math.random()*4);
        simonInput.push(random);
        console.log(simonInput);
      }
      function addColorActive(id,color){
         $("#"+id).addClass(color+"-active");
         playSound(id);
            setTimeout(function(){
            $("#"+id).removeClass(color+"-active");
          }, 500);
   }
     function gameWinner(){
      var count = 0;
      var winInterval = setInterval(function(){
        count++;
        $("#count").text("Win");
        if(count==5){
          clearInterval(winInterval);
          $("#count").text("00");
          count = 0;
        }

      },500);
     }

      function playSound(id){
        var sound = new Audio(soundArr[id]);
        sound.play();

      }
      function resetGame(){
        userInput = [];
        simonInput = [];
        score = 0;
        $("#count").text(score);

      }

