window.onload = function() {
  let rubyTypist = document.getElementById('ruby-typist');
  let typerData = rubyTypist.dataset.typer;
  let period = rubyTypist.getAttribute('data-period');

  if (typerData) {
    const objectData = {
      rubyTypist: rubyTypist,
      typerData: JSON.parse(typerData),
      period: period,
      loopNum: 0,
      txt: '',
      isDeleting: false,
      tick() {
        let fullTxt = this.typerData[this.loopNum];
        console.log(this);
        if (this.isDeleting) {
          this.txt = fullTxt.substring(0, this.txt.length - 1);
        } else {
          this.txt = fullTxt.substring(0, this.txt.length + 1);
        }
      
        this.rubyTypist.innerHTML = '<span class="wrap">' + this.txt + '</span>';

        let delta = 200;

        if (!this.isDeleting && this.txt === fullTxt) {
          delta = this.period;
          this.isDeleting = true;
        } else if (this.isDeleting && this.txt === '') {
          this.isDeleting = false;
          this.loopNum = (this.loopNum + 1) % this.typerData.length
          delta = 500;
        } else if (this.isDeleting) {
          delta /= 2;
        }

        setTimeout(function() {
          objectData.tick();
        }, delta);
      }
    }
    objectData.tick()
  }
  // INJECT CSS


  let animation = document.createElement("style");
  let keyFrameTyping = document.createElement("style");
  let keyFrameBlink = document.createElement("style");

  animation.innerHTML = "#ruby-typist > .wrap { border-right: 0.08em solid #000; margin: 1 auto; animation: typing 0.30s steps(40, end), blink .75s step-end infinite;}";
  keyFrameTyping.innerHTML = "@keyframes typing { from { width: 0% } to { width: 100% } }";
  keyFrameBlink.innerHTML ="@keyframes blink { from, to { border-color: transparent } 50% {  border-color: black; }}";
  document.body.appendChild(animation);
  document.body.appendChild(keyFrameTyping);
  document.body.appendChild(keyFrameBlink);
};
