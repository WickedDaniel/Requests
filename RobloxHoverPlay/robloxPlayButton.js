$(document).ready(function () {
    var RobloxHover = {
        carouselObserver: {},
        gameCard: {},
        playButton: {},
        Log: function (list = { "text": "" }) {
            console.log("RobloxHover || ", list.text)
        }
    };

    // Roblox Hover Button Model
    var RobloxHoverButton = `<button type="button" class="btn-common-play-game-lg btn-primary-md btn-full-width rbx-Hover-Button"
        style="height: 50px;display: none;align-items: center;justify-content: center;position: relative;top: 0px">
        <span class="icon-common-play larrow" style="position: absolute; top:0; left:0; right:0; bottom:0; margin:auto"></span>
        <span class="icon-common-play rarrow" style="position: absolute; top:0; left:0; right:0; bottom:0; margin:auto"></span>
    </button>`

    // Stores the Default Value of the carousel, this because of the
    // animations that are played when you hover over a game card
    RobloxHover.carouselObserver.MutationObserver = window.MutationObserver || window.WebKitMutationObserver;
    RobloxHover.carouselObserver.SetDefaultSize = function () {
        if (RobloxHover.gameCard.DefaultHeight) return;
        RobloxHover.gameCard.DefaultHeight = $(".game-carousel").height()+6
        RobloxHover.Log({ text: "SAVED DEFAULT SIZE: ".concat(RobloxHover.gameCard.DefaultHeight) })
    }

    // Iterates over the cards and sets up the button and the card
    RobloxHover.carouselObserver.iterateOverCards = function (values) {
        const carousel = values.addedNodes.item(0)
        $(carousel).find(".game-card-container").each(function (i, gameCard) {
            RobloxHover.carouselObserver.SetDefaultSize()
            RobloxHover.gameCard.setupCard(gameCard)
            RobloxHover.gameCard.setupButton(gameCard)
        })
    }

    // Listens to the updates made to the .game-home-page-container
    // and retrieves the .game-carousel's which contain the game cards
    RobloxHover.carouselObserver.Observer = new MutationObserver(function (mutations, observer) {
        for (const values of mutations) {
            if (!$(values.addedNodes.item(0)).hasClass("game-carousel")) continue;
            RobloxHover.carouselObserver.iterateOverCards(values)
        }
    });

    // Set Up the gamecard animations n stuff
    RobloxHover.gameCard.setupCard = function (gameCard) {
        $(gameCard).css("overflow", "hidden")
        $(gameCard).css("height", RobloxHover.gameCard.DefaultHeight)
        RobloxHover.gameCard.attachHover(gameCard)
    }

    // Same for the button that is appended to the gamecard, yknow, the join button
    // when you hover
    RobloxHover.gameCard.setupButton = function (gameCard) {
        $(gameCard).append(RobloxHoverButton)
        var cardBtn = $(gameCard).find(".rbx-Hover-Button")
        RobloxHover.gameCard.ButtonPosition = RobloxHover.gameCard.DefaultHeight + (cardBtn.height() / 2) - 12
        cardBtn.css("display", "flex")
        cardBtn.css("position", "absolute")
        cardBtn.css("top", RobloxHover.gameCard.ButtonPosition)
        RobloxHover.playButton.attachEvents($(gameCard).find(".rbx-Hover-Button"))

    }


    // !!! Main Hover Event, extension core feature

    RobloxHover.gameCard.attachHover = function (gameCard) {
        $(gameCard).on("mouseenter", function () {
            RobloxHover.gameCard.animateEnter(gameCard)
        });
        $(gameCard).on("mouseleave", function () {
            RobloxHover.gameCard.animateLeave(gameCard)
        });
    }

    // !!! Animations and stuff
    RobloxHover.gameCard.animateEnter = function (gameCard) {
        $(gameCard).find("div").stop().animate({
            right: $(gameCard).width()
        }, 125)
        $(gameCard).find(".rbx-Hover-Button").stop().animate({
            top: RobloxHover.gameCard.ButtonPosition / 1.35
        }, 250)
    }

    RobloxHover.gameCard.animateLeave = function (gameCard) {
        $(gameCard).find("div").stop().animate({
            right: "0px"
        }, 125)
        $(gameCard).find(".rbx-Hover-Button").stop().animate({
            top: RobloxHover.gameCard.ButtonPosition
        }, 250)
    }

    RobloxHover.playButton.attachEvents = function (playButton) {
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

    RobloxHover.playButton.joinPlace = function (playButton) {
        var placeID = $(playButton).parent().find("a").attr("href").match(/(\d+)\//gm)[0]
        RobloxHover.Log({text: "JOINING GAME ".concat(placeID)})
        // Would use, don't know why, I'll stick with the old method
        // Roblox.GameLauncher.joinGameInstance(placeID)
        // Old method
        window.location = "roblox://placeId=" + placeID;
    }

    RobloxHover.playButton.animateEnter = function (playButton) {
        $(playButton).find(".rarrow").stop().animate({
            right: "30px"
        }, 125)
        $(playButton).find(".larrow").stop().animate({
            left: "30px"
        }, 125)
    }

    RobloxHover.playButton.animateLeave = function (playButton) {
        $(playButton).find(".rarrow").stop().animate({
            right: "0px"
        }, 125)
        $(playButton).find(".larrow").stop().animate({
            left: "0px"
        }, 125)
    }


    // Retrieves the .game-home-page-container and connects the observer to it
    $("main").on("DOMNodeInserted", function (obj) {
        const elementToObserve = document.querySelector(".game-home-page-container").querySelector("div");
        if (elementToObserve) {
            RobloxHover.Log({ "text": "Game Container Found" })
            RobloxHover.carouselObserver.Observer.observe(elementToObserve, { childList: true })
            $("main").off("DOMNodeInserted");
        }
    })
})