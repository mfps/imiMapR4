// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require vendor/jquery
//= require jquery_ujs
//= require extra/owl.carousel
//= require extra/wow.min
//
//= require jquery_nested_form
//= require_tree .
//= require chosen-jquery
//= require d3
//= require stupidtable.min
//= require gmaps/google

$(window).load(function () {
      $(".alert-info").animate({opacity: 1.0}, 5000).fadeOut('slow');

      $("#close").click(function(){
        $(".msgbox").fadeOut("400")
      $.cookie('fadeOut', true);
});

    if($.cookie('fadeOut') == 'true'){
        $('.msgbox').hide();
    } else {
        $('.msgbox').click();
    }   

    $(".edit-rating .rating_star").click(function() {
      var val = $(this).attr('data-rating-id');
      var id = $(this).parent().parent().attr("id");
      setStars(val, id);
      setValue(val, id);
    });

  var setStars = function(val, id) {
    stars = $("#"+id+" .rating_star");
    $(stars).each(function(){
      var currentId = $(this).attr('data-rating-id');
      if (currentId <= val)
        $(this).addClass('on')
      else 
        $(this).removeClass('on')
    })
  }

  var setValue = function(val, id) {
    $("#internship_internship_rating_attributes_"+id).val(val);
  }

});

$(document).ready(function() {

  // make the whole fav table row klickable
  $(".fav_raw_click").click(function(){
    window.document.location = $(this).data("href");
  });

    $("#hide_all").click(function () {
       $(".answer").slideToggle("slow");
       $(".comment").slideToggle("slow");
       $(".answer_2").slideToggle("slow");
       $("#comment_form").slideToggle("slow");
    });
    $(".info_signup").hide();
    $(".icon-info-sign").mouseover(function(){
      $("#popup").fadeIn("slow");
    });
    $(".icon-info-sign").mouseleave(function(){
      $("#popup").fadeOut("slow");
    });

  $(".recommend-edit").click(function() {
      $(this).toggleClass( "fa fa-check" );
      $(this).toggleClass( "fa fa-times" );
      toggle_value("#internship_recommend");
  });

  $(".recommend-publicmail").click(function() {
      $(this).toggleClass( "fa fa-check" );
      $(this).toggleClass( "fa fa-times" );
      toggle_value("#user_publicmail");
  });

  $(".recommend-mailnotif").click(function() {
      $(this).toggleClass( "fa fa-check" );
      $(this).toggleClass( "fa fa-times" );
      toggle_value("#user_mailnotif");
  });
  
  toggle_value = function(id) {
    var elem =  $(id);
    var value = elem.val();
    if (value === "0") {
      elem.val("1");
    } else if (value === "1") {
      elem.val("0");
    }
  }


});

click_reset = function() {
  $(".chzn-select").val('').trigger("liszt:updated");
  $(".search-choice").remove();
  $("#search_button").click();
}


/***************** LOGIN ***************************/

var LoginModalController = {
    tabsElementName: ".logmod__tabs li",
    tabElementName: ".logmod__tab",
    inputElementsName: ".logmod__form .input",
    hidePasswordName: ".hide-password",
    
    inputElements: null,
    tabsElement: null,
    tabElement: null,
    hidePassword: null,
    
    activeTab: null,
    tabSelection: 0, // 0 - first, 1 - second
    
    findElements: function () {
        var base = this;
        
        base.tabsElement = $(base.tabsElementName);
        base.tabElement = $(base.tabElementName);
        base.inputElements = $(base.inputElementsName);
        base.hidePassword = $(base.hidePasswordName);
        
        return base;
    },
    
    setState: function (state) {
      var base = this,
            elem = null;
        
        if (!state) {
            state = 0;
        }
        
        if (base.tabsElement) {
          elem = $(base.tabsElement[state]);
            elem.addClass("current");
            $("." + elem.attr("data-tabtar")).addClass("show");
        }
  
        return base;
    },
    
    getActiveTab: function () {
        var base = this;
        
        base.tabsElement.each(function (i, el) {
           if ($(el).hasClass("current")) {
               base.activeTab = $(el);
           }
        });
        
        return base;
    },
   
    addClickEvents: function () {
      var base = this;
        
        base.hidePassword.on("click", function (e) {
            var $this = $(this),
                $pwInput = $this.prev("input");
            
            if ($pwInput.attr("type") == "password") {
                $pwInput.attr("type", "text");
                $this.text("Hide");
            } else {
                $pwInput.attr("type", "password");
                $this.text("Show");
            }
        });
 
        base.tabsElement.on("click", function (e) {
            var targetTab = $(this).attr("data-tabtar");
            
            e.preventDefault();
            base.activeTab.removeClass("current");
            base.activeTab = $(this);
            base.activeTab.addClass("current");
            
            base.tabElement.each(function (i, el) {
                el = $(el);
                el.removeClass("show");
                if (el.hasClass(targetTab)) {
                    el.addClass("show");
                }
            });
        });
        
        base.inputElements.find("label").on("click", function (e) {
           var $this = $(this),
               $input = $this.next("input");
            
            $input.focus();
        });
        
        return base;
    },
    
    initialize: function () {
        var base = this;
        
        base.findElements().setState().getActiveTab().addClickEvents();
    }
};

$(document).ready(function() {
    LoginModalController.initialize();
});

/********************** LOGIN END **********************/
 



(function($){
  $(document).ready(function(){
    $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
      event.preventDefault(); 
      event.stopPropagation(); 
      $(this).parent().siblings().removeClass('open');
      $(this).parent().toggleClass('open');
    });
    


    /*** FILTER ***/
    var $btns = $('.filter_btn').click(function() {

      console.log(this.id)
      if (this.id == 'all') {
        $('#parent > div').fadeIn(450);
      } else {
        var $el = $('.' + this.id).fadeIn(450);
        $('#parent > div').not($el).hide();
      }
      $btns.removeClass('active');
      $(this).addClass('active');
    })




    /** MIXIT **/
    $(function(){
      $('#Container').mixItUp();
    });


  });
})(jQuery);

  