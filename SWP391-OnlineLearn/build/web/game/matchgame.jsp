<%-- 
    Document   : matchgame
    Created on : Feb 13, 2023, 2:16:24 AM
    Author     : Acer
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>--> 
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MatchGame</title>
    <link rel="icon" href="../Assets/icon/favicon.png"/>
    <link rel="stylesheet" href="../Assets/css/Style.css">
    <link rel="stylesheet" href="../game/css/matchgame.css"/>
    <!-- link bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body style="background-image: url(../Assets/images/bg.png)">
    <div class="overlay-text visible">
        <button class="button"> Start</button> 
    </div>
    <div id="timeout-text" class="overlay-text">
        Time out!
        <span class="overlay-text-small">Click to continue</span>
    </div>
    <div id="winning-text" class="overlay-text">
        Clear!
        <span class="overlay-text-small">Click to continue</span>
    </div>
    <!--nav bar-->
    <jsp:include page="../custom/nav.jsp"></jsp:include>
    <!--content-->
    <div class="flex-container">
        <div id="game-container flex-items">
            <h1 style="margin: 1em 2em; padding: 0 4em; color: white; background-image: linear-gradient(to right, #00de7a, #195de2)">${requestScope.lession_name}</h1>
            <section class ="match-game">

                <c:forEach items="${requestScope.mg}" var="m">

                    <div class="match-card-container" data-image ="${m.match_game_id}">
                        <img class="match-card" src="${m.img.img_url}" alt="alt"/>
                    </div>
                    <div class="match-card-container" data-image ="${m.match_game_id}">
                        <img class="match-card" src="${m.ans_img.ans_img_url}" alt="alt"/>
                    </div>

                </c:forEach>



            </section>
        </div>
        <div class="game-info-container flex-items" >
            <div class="game-info">
                Time <span id="time-remaining">100</span>
            </div>
            <div class="game-info">
                Points <span id="points">0</span>
            </div>

        </div>
    </div>


</body>

<script>
    const cards = document.querySelectorAll('.match-card-container');
    let hasChosenCard = false;
    let firstCard, secondCard;
    let lockBoard = false;
    let matched_pair = 0;
    let points = document.getElementById('points');
    function chooseCard() {
        if (lockBoard)
            return;
        this.classList.add('chosen');
        gameInfo.audioController.flip();
        if (!hasChosenCard) {
            hasChosenCard = true;
            firstCard = this;
            console.log({hasChosenCard, firstCard});
            return;
        } else {
            hasChosenCard = false;
            secondCard = this;
            checkMatchedCard();
        }
        function checkMatchedCard() {
            if (firstCard.dataset.image === secondCard.dataset.image) {
                gameInfo.audioController.success();
                firstCard.removeEventListener('click', chooseCard);
                secondCard.removeEventListener('click', chooseCard);
                firstCard.classList.add('hide');
                secondCard.classList.add('hide');
                matched_pair++;
                points.innerText = matched_pair * 50;
                if (matched_pair == 8) {
                    gameInfo.victory();
                }
            } else {
                gameInfo.audioController.ohNo();
                lockBoard = true;
                setTimeout(() => {
                    firstCard.classList.remove('chosen');
                    secondCard.classList.remove('chosen');
                    lockBoard = false;
                }, 800);
            }
        }
    }
    (function shuffle() {
        cards.forEach(card => {
            let randomPos = Math.floor(Math.random() * 12);
            card.style.order = randomPos;
        });
    })();
    cards.forEach(card => card.addEventListener('click', chooseCard));
    class AudioController {
        constructor() {
            this.bgMusic = new Audio('sounds/sounds/bg-music.mp3');
            this.successSound = new Audio('sounds/sounds/success.mp3');
            this.ohNoSound = new Audio('sounds/sounds/oh no sound effect.mp3');
            this.flipSound = new Audio('sounds/sounds/flip.wav');
            this.matchSound = new Audio('sounds/sounds/match.wav');
            this.victorySound = new Audio('sounds/sounds/victory.wav');
            this.gameOverSound = new Audio('sounds/sounds/gameOver.wav');
            this.bgMusic.volume = 0.5;
            this.bgMusic.loop = true;
        }
        startMusic() {
            this.bgMusic.play();
        }
        stopMusic() {
            this.bgMusic.pause();
            this.bgMusic.currentTime = 0;
        }
        success() {
            this.successSound.play();
        }
        flip() {
            this.flipSound.play();
        }
        ohNo() {
            this.ohNoSound.play();
        }
        match() {
            this.matchSound.play();
        }
        victory() {
            this.stopMusic();
            this.victorySound.play();
        }
        gameOver() {
            this.stopMusic();
            this.gameOverSound.play();
        }
    }
    class GameInforController {
        constructor(totalTime) {
            this.totalTime = totalTime;
            this.timeRemaining = totalTime;
            this.timer = document.getElementById('time-remaining')
            this.audioController = new AudioController();
        }
        startGame() {
            this.timeRemaining = this.totalTime;
            this.busy = true;
            setTimeout(() => {
                this.audioController.startMusic();
                this.countdown = this.startCountdown();
                this.busy = false;
            }, 500)
            this.timer.innerText = this.timeRemaining;
        }
        startCountdown() {
            return setInterval(() => {
                this.timeRemaining--;
                this.timer.innerText = this.timeRemaining;
                if (this.timeRemaining === 0)
                    this.timeout();
            }, 1000);
        }
        timeout() {
            clearInterval(this.countdown);
            this.audioController.gameOver();
            document.getElementById('timeout-text').classList.add('visible');
        }
        victory() {
            clearInterval(this.countdown);
            this.audioController.victory();
            document.getElementById('winning-text').classList.add('visible');
        }
    }
    const gameInfo = new GameInforController(100);
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', ready());
    } else {
        ready();
    }
    function ready() {
        let overlays = Array.from(document.getElementsByClassName('overlay-text'));
        overlays.forEach(overlay => {
            overlay.addEventListener('click', () => {
                overlay.classList.remove('visible');
                gameInfo.startGame();
            });
        });
    }
</script>
</html>