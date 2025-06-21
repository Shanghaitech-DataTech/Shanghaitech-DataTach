 /* Code for changing active link on clicking */
 var btns =
     $(".navbar-nav .nav-link");

 for (var i = 0; i < btns.length; i++) {
     btns[i].addEventListener("click",
         function() {
             var current = document
                 .getElementsByClassName("active");

             current[0].className = current[0]
                 .className.replace(" active", "");

             this.className += " active";
         });
 }

 /* Code for changing active 
 link on Scrolling */
 $(window).scroll(function() {
     var distance = $(window).scrollTop();
     $('.page-section').each(function(i) {

         if ($(this).position().top <=
             distance + 250) {

             $('.navbar-nav a.active')
                 .removeClass('active');

             $('.navbar-nav a').eq(i)
                 .addClass('active');
         }
     });
 }).scroll();

 document.addEventListener('DOMContentLoaded', function() {
     const themeToggle = document.getElementById('theme-toggle');
     if (!themeToggle) {
         return;
     }

     const body = document.body;
     const navbarLogo = document.getElementById('navbar-logo');
     const aboutLogo = document.getElementById('about-logo');
     const shanghaiTechLogo = document.getElementById('ShanghaiTech-logo');

     const whiteLogoSrc = './img/datatechlogo_b.svg';
     const blackLogoSrc = './img/datatechlogo_w.svg';

     function updateThemeForDayMode(isDay) {
         body.classList.toggle('day-mode', isDay);
         if (navbarLogo) navbarLogo.src = isDay ? blackLogoSrc : whiteLogoSrc;
         if (aboutLogo) aboutLogo.src = isDay ? blackLogoSrc : whiteLogoSrc;
         if (shanghaiTechLogo) shanghaiTechLogo.style.filter = isDay ? 'invert(1)' : 'none';
     }

     // Initial theme setup
     updateThemeForDayMode(body.classList.contains('day-mode'));

     themeToggle.addEventListener('click', () => {
         updateThemeForDayMode(!body.classList.contains('day-mode'));
     });
 });