$(document).ready(function () {
    var RobloxHover = {
        "Home": {},
        "gameCard": {},
        "playButton": {}
    };
    var RobloxHoverButton = `<button type="button" class="btn-common-play-game-lg btn-primary-md btn-full-width rbx-Hover-Button"
        style="height: 50px;display: none;align-items: center;justify-content: center;position: relative;top: 0px">
        <span class="icon-common-play larrow" style="position: absolute; top:0; left:0; right:0; bottom:0; margin:auto"></span>
        <span class="icon-common-play rarrow" style="position: absolute; top:0; left:0; right:0; bottom:0; margin:auto"></span>
    </button>`

    // ATTACH > HOME {
    // !!! Get the gameCards container on the homepage
    RobloxHover.Home.attachMain = function (){
        $("main").on("DOMNodeInserted", function (obj) {
            if ($(obj.target).hasClass("game-home-page-container")) {
                RobloxHover.Home.attachHomeGrid();
                $("main").off("DOMNodeInserted");
            }
        });
    };
    
    RobloxHover.Home.attachHomeGrid = function(){
        $(".game-home-page-container").on("DOMNodeInserted", function (obj) {
            $(obj.target).find(".game-card-container").each(function(i, gameCard){
                if (!RobloxHover.gameCard.DefaultHeight){
                    RobloxHover.gameCard.DefaultHeight = $(".game-carousel").height()
                    console.warn("RobloxHover || SAVED DEFAULT SIZE: ", RobloxHover.gameCard.DefaultHeight)
                }
                RobloxHover.gameCard.setupCard(gameCard)
                RobloxHover.gameCard.setupButton(gameCard)
            })
        });        
    }

    RobloxHover.gameCard.setupCard = function (gameCard){
        $(gameCard).css("overflow", "hidden")
        $(gameCard).css("height", RobloxHover.gameCard.DefaultHeight)
        RobloxHover.gameCard.attachHover(gameCard)
    }

    RobloxHover.gameCard.setupButton = function(gameCard){
        $(gameCard).append(RobloxHoverButton)
        var cardBtn = $(gameCard).find(".rbx-Hover-Button")
        RobloxHover.gameCard.ButtonPosition = RobloxHover.gameCard.DefaultHeight+(cardBtn.height()/2)-12
        cardBtn.css("display", "flex")
        cardBtn.css("position", "absolute")
        cardBtn.css("top", RobloxHover.gameCard.ButtonPosition)
        RobloxHover.playButton.attachEvents($(gameCard).find(".rbx-Hover-Button"))

    }


    // !!! Main Hover Event, extension core feature

    RobloxHover.gameCard.attachHover = function(gameCard){
        $(gameCard).on("mouseenter", function () {
            RobloxHover.gameCard.animateEnter(gameCard)
        });
        $(gameCard).on("mouseleave", function () {
            RobloxHover.gameCard.animateLeave(gameCard)
        });
    }

    RobloxHover.gameCard.animateEnter = function(gameCard){
        $(gameCard).find("div").stop().animate({
            right: $(gameCard).width()
        }, 125)
        $(gameCard).find(".rbx-Hover-Button").stop().animate({
            top: RobloxHover.gameCard.ButtonPosition/1.35
        }, 250)
    }

    RobloxHover.gameCard.animateLeave = function(gameCard){
        $(gameCard).find("div").stop().animate({
            right: "0px"
        }, 125)
        $(gameCard).find(".rbx-Hover-Button").stop().animate({
            top: RobloxHover.gameCard.ButtonPosition
        }, 250)
    }

    RobloxHover.playButton.attachEvents = function(playButton){
        $(playButton).on("mouseenter", function () {
            RobloxHover.playButton.animateEnter(playButton)
        });
        $(playButton).on("mouseleave", function () {
            RobloxHover.playButton.animateLeave(playButton)
        });
        $(playButton).on("click", function () {
            RobloxHover.playButton.joinPlace(playButton)
        });
    }

    RobloxHover.playButton.joinPlace = function(playButton){
        var placeID = $(playButton).parent().find("a").attr("href").match(/(\d+)\//gm)[0]
        console.warn(placeID)
        window.location = "roblox://placeId="+placeID;
    }

    RobloxHover.playButton.animateEnter = function(playButton){
        $(playButton).find(".rarrow").stop().animate({
            right: "30px"
        }, 125)
        $(playButton).find(".larrow").stop().animate({
            left: "30px"
        }, 125)
    }

    RobloxHover.playButton.animateLeave = function(playButton){
        $(playButton).find(".rarrow").stop().animate({
            right: "0px"
        }, 125)
        $(playButton).find(".larrow").stop().animate({
            left: "0px"
        }, 125)
    }

    RobloxHover.Home.attachMain()
});

