$(document).ready(function() {
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
    
    function checkHalfWidthDigit(a,b,c){
      $(a).keyup(function(){
      var input = $(this).val();
      
      if( input.match( /[^0-9.,-]+/ ) ) {
        $(b).removeClass("error-inactive");
        $(c).prop('disabled',true);
      }else{
        $(b).addClass("error-inactive");
        $(c).prop('disabled',false);
      }
      });
    }
    
    checkHalfWidthDigit("#form-weight","#num-error-w","#form-btn");
    checkHalfWidthDigit("#form-protein","#num-error-p","#form-btn");
    checkHalfWidthDigit("#form-weight-fix","#num-error-w-fix","#form-btn-fix");
    checkHalfWidthDigit("#form-protein-fix","#num-error-p-fix","#form-btn-fix");
    
   /*function checkInput(){
     var inputWeight = $("#form-weight").val();
     var inputProtein = $("form-protein").val();
      
     if( inputWeight.match( /[^0-9.,-]+/ ) &&
         inputProtein.match( /[^0-9.,-]+/ )
     ) {
       $("#form-btn").prop('disabled',true);
     }else{
       $("#form-btn").prop('disabled',false);
     }
   }*/
      
    $("#form-weight").keyup(function(){
      var inputWeight = $("#form-weight").val();
      var inputProtein = $("form-protein").val();
      
     if( inputWeight.match( /[^0-9.,-]+/ ) && inputProtein.match( /[^0-9.,-]+/ )) {
       $("#form-btn").prop('disabled',true);
     }else{
       $("#form-btn").prop('disabled',false);
     }
    });
    
    $("#form-protein").keyup(function(){
     var inputWeight = $("#form-weight").val();
     var inputProtein = $("form-protein").val();
      
     if( inputProtein.match( /[^0-9.,-]+/ )) {
       $("#form-btn").prop('disabled',true);
     }else{
       $("#form-btn").prop('disabled',false);
     }
    });
      
    
});