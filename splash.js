/* =====================================================
   CSSAS SPLASH JAVASCRIPT
===================================================== */


/* =====================================================
   OPENING SPLASH
===================================================== */

window.addEventListener("load", function () {

    const splash =
        document.getElementById("cssasSplash");

    if (!splash) return;


    /*
       Splash stays for 1.5 seconds
    */

    setTimeout(function () {

        splash.style.opacity = "0";


        /*
           Remove it completely
           after fade-out
        */

        setTimeout(function () {

            splash.remove();

            document.body.style.overflow =
                "auto";

        }, 350);

    }, 1500);

});


/* =====================================================
   CLOSING SPLASH
===================================================== */

function cssasCloseAndGo(url) {

    const splash =
        document.getElementById(
            "cssasCloseSplash"
        );

    if (!splash) {

        window.location.href = url;

        return;

    }


    /*
       Show closing splash
    */

    splash.style.display = "flex";


    /*
       Start animation
    */

    splash.classList.add("closing");


    /*
       Wait for animation
       before changing page
    */

    setTimeout(function () {

        window.location.href = url;

    }, 700);

}


/* =====================================================
   INTERNAL LINKS
===================================================== */

document.addEventListener(
    "click",
    function (event) {

        const link =
            event.target.closest("a");


        if (!link) return;


        const url =
            link.href;


        if (!url) return;


        /*
           Ignore:

           - external websites
           - new tabs
           - # links
           - javascript links
        */

        if (

            link.target === "_blank" ||

            link.hostname !==
            window.location.hostname ||

            link.hash

        ) {

            return;

        }


        /*
           Stop normal navigation
        */

        event.preventDefault();


        /*
           Play closing animation
        */

        cssasCloseAndGo(url);

    }
);
