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
    <title></title>
    
   
    <!-- link bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
    <body>
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
        
        <div class="nav">
            <div class="nav-bar">
                <ul class="items">
                    <li class="item">
                        <a href="#"><img src="../Assets/icon/icon (69).png"></a>
                    </li>
                    <li class="item">
                        <a href="#"><img src="../Assets/icon/icon (44).png"></a>
                    </li>
                    <li class="item">
                        <a href="#"><img src="../Assets/icon/icon (71).png"></a>
                    </li>
                    <li class="item">
                        <a href="#"><img src="../Assets/icon/icon (51).png"></a>
                    </li>
                    <li class="item">
                        <a href="#"><img src="../Assets/icon/icon (45).png"></a>
                    </li>
                    <li class="item avt-btn">
                        <a href="#"><img src="../Assets/icon/icon (4).png">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
<div class="flex-container">
   
    <div id="game-container flex-items">
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
    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body{
            width: 100%;
            margin-left: 5%;
            background-image: url(images/bg.png);
            background-size: 100vw;
            width: 100vw;
            height: 100vh;
        }

        .nav {
            position: fixed;
            width: 5%;
            background-color: #00de7a;
            height: 100vh;
        }

        .nav-bar {
            margin: auto;
        }

        ul li {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .items {
            margin: 0;
            padding: 0;
        }

        .item {
            border-radius: 15px;
            border: 2px solid #ccc;
            margin: 2em auto;
            background-color: white;
            cursor: pointer;
        }

        .nav-bar img {
            width: 3em;
        }

        .avt-btn {
            position: fixed;
            border-radius: 50%;
            bottom: 0;
        }

        .flex-container {
            display: flex;
        }

        .flex-items{
            flex-direction: row ;
        }

        .game-info-container {
            margin: auto;
            border: #f1ece9 solid 1px;
            background-color: #10e88a;
            opacity: 95%;
            width: 240px;
            height: 240px;
            display: flex;
            opacity: 95%;
            color:#fff;
        }

        .game-info-container.visible{
            margin: auto;
            border: #f1ece9 solid 1px;
            background-color: #10e88a;
            opacity: 95%;
            width: 240px;
            height: 200px;
            display: flex;
            opacity: 95%;
            color:#fff;
        }

        .game-info {
            color: #fff;
            font-size: 2em;
            font-family: 'Roboto', sans-serif;
            flex-direction: row;
            justify-items: center;
        }


        .match-game{
            width: 640px;
            height: 480px;
            margin-top: 50px;
            margin-bottom : auto;
            margin-left: 150px;
            margin-right: auto;
            display: flex;
            flex-wrap: wrap;
        }

        .match-card-container{
            width: 25%;
            height: 25%;
            position: relative;
            border: 5px solid #FAEBD7;
            transform: scale(1);
        }

        .match-card-container:active{
            transform: scale(.97);
            transition: transform .2s;
        }

        .match-card-container.chosen{
            transform: scale(0.90);
        }

        .match-card-container.hide{
            display: none;
        }

        .match-card{
            width: 100%;
            height: 100%;
            padding: 20px;
            border-radius:  5px;
            position: absolute;
            background:  #00de7e;
        }

        img{
            width: 100%;
            height: 100%;
        }

        .overlay-text {
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 100;
            display: none;
            position: fixed;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            color: yellow;
            transition: background-color 500ms, font-size 500ms;
        }

        .overlay-text-small {
            font-size: .3em;
        }

        .overlay-text.visible {
            display: flex;
            animation: overlay-grow 500ms forwards;
        }


        @keyframes overlay-grow {
            from {
                background-color: rgba(0, 0, 0, 0);
                font-size: 0;
            }
            to {
                background-color: rgba(0, 0, 0, .8);
                font-size: 10em;
            }
        }

        .button {
            background-image: linear-gradient(135deg, #008aff, #86d472);
            border-radius: 6px;
            box-sizing: border-box;
            color: #ffffff;
            display: block;
            height: 30px;
            font-size: 1.4em;
            font-weight: 600;
            padding: 4px;
            position: relative;
            text-decoration: none;
            width: 2em;
            z-index: 2;
        }
        .button:hover {
            color: #fff;
        }
        .button  {
            align-items: center;
            background: #0e0e10;
            border-radius: 6px;
            display: flex;
            justify-content: center;
            height: 100%;
            transition:  0.5s ease;
            width: 100%;
        }


  
    </style>
    <script>
                    const cards = document.querySelectorAll('.match-card-container');

            let hasChosenCard = false;
            let firstCard, secondCard;
            let lockBoard = false; 
            let matched_pair = 0;
            let points = document.getElementById('points');

            function chooseCard(){
                if(lockBoard) return;
                this.classList.add('chosen');
                gameInfo.audioController.flip();

            if(!hasChosenCard){
                hasChosenCard = true;
                firstCard = this;
                console.log({hasChosenCard, firstCard});
                return;
            }else{
                    hasChosenCard = false;
                    secondCard = this;


                    checkMatchedCard(); 

            }

            function checkMatchedCard(){

                    if(firstCard.dataset.image === secondCard.dataset.image){
                            gameInfo.audioController.success();
                            firstCard.removeEventListener('click', chooseCard);
                            secondCard.removeEventListener('click', chooseCard);
                            firstCard.classList.add('hide');
                            secondCard.classList.add('hide');
                            matched_pair ++;
                            points.innerText = matched_pair*50;
                            if(matched_pair == 8){
                                gameInfo.victory();
                            }
                    }else{
                        gameInfo.audioController.ohNo();
                        lockBoard = true;
                        setTimeout(()=>{
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
                    this.bgMusic = new Audio('image/sounds/bg-music.mp3');
                    this.successSound = new Audio('image/sounds/success.mp3');
                    this.ohNoSound = new Audio('image/sounds/oh no sound effect.mp3');
                    this.flipSound = new Audio('image/sounds/flip.wav');
                    this.matchSound = new Audio('image/sounds/match.wav');
                    this.victorySound = new Audio('image/sounds/victory.wav');
                    this.gameOverSound = new Audio('image/sounds/gameOver.wav');
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

            class GameInforController{
                constructor(totalTime){
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
                        if(this.timeRemaining === 0)
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


            if(document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', ready());
            }else{
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