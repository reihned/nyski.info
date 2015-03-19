if(window.location.hostname == "nyski.info"){
  //code for main website
}else if(window.location.hostname == "http://ancient-crag-6291.herokuapp.com/"){
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-60901253-1', 'auto');
  ga('send', 'pageview');
}else{
  console.log("Google Analytics not loaded");
}
