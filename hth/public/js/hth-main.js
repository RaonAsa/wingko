$(document).ready(function() {
	// Initialize Tootip
	$('[data-toogle="tooltip"]').tooltip();

	// Add smooth scrolling to all links in navbar + footer link
    $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

        // Prevent default anchor click behavior
        event.preventDefault();

        // Store hash
        var hash = this.hash;

        // Using jQuery's animate() method to add smooth page scroll
        // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
        $('html, body').animate({
            scrollTop: $(hash).offset().top
        }, 900, function(){
            // Add hash (#) to URL when done scrolling (default click behavior)
            window.location.hash = hash;
        });
    });

    //
    $(".dropdown-menu").on("click", "li > a", function(event){
        // console.log("You clicked the drop downs", event);
        var vTarget = $(event.target).data("target");
        // console.log("target : " + vTarget);
        // scrollTop:$("#companyInfo-intro").offset().top;
        var position = $("#"+vTarget).offset();
        // console.log("pos : " + position);
        $('html, body').animate({scrollTop : position.top}, 900);
    });
})
