


$(document). on("click", function(){
  if($("#sidebar-wrapper").hasClass('active')){
      $("#sidebar-wrapper").removeClass("active");
  }
            });

$(document). on("click", '#menu-close', function(e){
        e.stopPropagation();
          $("#sidebar-wrapper").removeClass("active");
            });


$(document). on("click", '#menu-toggle', function(e){
         e.stopPropagation();
          $("#sidebar-wrapper").toggleClass("active");
            });
