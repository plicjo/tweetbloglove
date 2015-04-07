(function($, window, undefined){

  var app = {};
  windowHeight = 0;
  windowWidth  = 0;

  app.getWindowSize = function() {
    function viewport() {
      var e = window, a = 'inner';
      if (!('innerWidth' in window )) {
        a = 'client';
        e = document.documentElement || document.body;
      }
      return { width : e[ a+'Width' ] , height : e[ a+'Height' ] };
    }
    windowHeight = viewport().height;
    windowWidth  = viewport().width;
  };

  $(document).ready(function(){
    app.getWindowSize();
  });

  $(window).on("resize", function(){
    app.getWindowSize();
  });

})(jQuery, window);