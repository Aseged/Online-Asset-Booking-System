
   

    // code for top sticky menu animation
    $(function () {
        var cubuk_seviye = $(document).scrollTop();
        var header_yuksekligi = $('#logoDiv').outerHeight();

        $(window).scroll(function () {
            var kaydirma_cubugu = $(document).scrollTop();

            if (kaydirma_cubugu > header_yuksekligi) { $('#logoDiv').addClass('gizle'); }
            else { $('#logoDiv').removeClass('gizle'); }

            if (kaydirma_cubugu > cubuk_seviye) { $('#logoDiv').removeClass('sabit'); }
            else { $('#logoDiv').addClass('sabit'); }

            cubuk_seviye = $(document).scrollTop();
        });
    });


    //code for scrolling transition for links

    $(function () {
        $('a[href*=#]:not([href=#])').click(function () {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    
    
    // code for scroll to top
    $(document).ready(function () {

        //Check to see if the window is top if not then display button
        $(window).scroll(function () {
            if ($(this).scrollTop() > 300) {
                $('.scrollToTop').fadeIn();
            } else {
                $('.scrollToTop').fadeOut();
            }
        });

        //Click event to scroll to top
        $('.scrollToTop').click(function () {
            $('html, body').animate({ scrollTop: 0 }, 300);
            return false;
        });

    });





//code for calandar 

    $(document).ready(function () {

        //make past dates unavailable  
        // have the "datepicker" class set
        $('input.dropdownArrow1').Zebra_DatePicker({
            direction: true,
            disabled_dates: ['* * * 0,6'],
            pair: $('input.dropdownArrow2')
        });

        $('input.dropdownArrow2').Zebra_DatePicker({
            direction: true,
            disabled_dates: ['* * * 0,6']
        });

    });

    

    


    