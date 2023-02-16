/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
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



