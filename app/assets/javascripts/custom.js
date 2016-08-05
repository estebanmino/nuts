$(document). on("click", function(){
  if($("#sidebar-wrapper").hasClass('active')){
      $("#sidebar-wrapper").removeClass("active");
  }
            });

$(document). on("click", '#sidebar-close', function(e){
        e.stopPropagation();
          $("#sidebar-wrapper").removeClass("active");
            });


$(document). on("click", '#sidebar-toggle', function(e){
         e.stopPropagation();
          $("#sidebar-wrapper").toggleClass("active");
            });
