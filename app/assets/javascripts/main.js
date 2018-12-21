$(document).ready(function() {
  
  "use strict";
  
  //flash関連
   var fadeOutFlash = function(){
      $(".fade-out-flash").fadeOut();
    };
    setTimeout(fadeOutFlash, 4000);
    
    $("#close-flash").click(function(){
      $(".fade-out-flash").addClass("hidden");
    });
    
    $("#open-modal-diary").click(function(){
      $("#modal-diary").removeClass("hidden");
      $("#mask").removeClass("hidden");
    });
    $("#mask").click(function(){
      $("#modal-diary").addClass("hidden");
      $("#mask").addClass("hidden");
    });
    $("#close-modal-diary").click(function(){
      $("#mask").click()
    });
    
    
    //日付(失敗)
    var today, this_month, this_day, optionLoop;
    
    today = new Date();
    this_month = today.getMonth();
    this_day = today.getDate();
    
    optionLoop = function(start, end, id, this_day){
      var i, option;
      option = null;
      
      for(i=start; i<=end; i++){
        if (i == this_day){
          option+= "<option value='"+ i + "' selected>"+ i +"</option>";
        }else{
           option+= "<option value='"+ i + "'>"+ i +"</option>";
        }
        
        return document.getElementById(id).innerHTML = option;
      }
    };
    
    optionLoop(1, 12, "id_month", this_month);
    optionLoop(1, 31, "id_day", this_day);
    
    
      
    
});