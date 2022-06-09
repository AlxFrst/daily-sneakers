var pattern = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'];
var current = 0;

var keyHandler = function (event) {

  // If the key isn't in the pattern, or isn't the current key in the pattern, reset
  if (pattern.indexOf(event.key) < 0 || event.key !== pattern[current]) {
    current = 0;
    return;
  }

  // Update how much of the pattern is complete
  current++;

  // If complete, alert and reset
  if (pattern.length === current) {
    current = 0;
    document.querySelector('.container').insertAdjacentHTML('beforeEnd', `
    <div id="wrapper">
      <div id="bluuuurrrrrp" class="blurp-slider"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1055214/Rick-Spaceship.png" alt="">
      <div class="bubble d-none sentence1">
      let's try my new portal gun Morty</div>
      <div class="bubble d-none sentence2">
      Oh shit!</div></div>
    </div>
    <div class="portal d-none">
      <div class="swish">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
      <div class="swirl">
        <span></span>
        <span></span>
        <span></span>
        <div class="swirl">
        <span></span>
          <div class="swirl">
        <span></span>
            <div class="swirl">
        <span></span>
              <div class="swirl">
        <span></span>
                <div class="swirl">
        <span></span>
                <div class="swirl">
        <span></span>
                  <div class="swirl">
        <span></span></div>
                </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>`)
    setTimeout(() => {
      document.querySelector('.sentence1').classList.remove('d-none')
    }, 2000);
    setTimeout(() => {
      document.querySelector('.sentence1').classList.add('d-none')
      document.querySelector('.sentence2').classList.remove('d-none')
      document.querySelector('.portal').classList.remove('d-none')
    }, 7000);
    setTimeout(() => {
      document.querySelector('.sentence2').classList.add('d-none')
      document.querySelector('#bluuuurrrrrp img').classList.add('blurp-reduce')
    }, 10000);
    setTimeout(() => {
      //Add some styles to the page
var styleNode = document.createElement ("style");

styleNode.type = "text/css";
styleNode.textContent = ".vortex-removed{visibility: hidden;} .vortex-attracted{ animation: attraction 2.1s infinite linear; } @keyframes attraction {from {transform: rotate(0deg) scale(1);}to { transform: rotate(359deg) scale(0);}};";

document.head.appendChild (styleNode);
document.body.style['overflow-x'] = 'hidden';

//Get all the elements of the page
var all_elements = document.querySelectorAll('*:not(html, head, title, link, meta, script, style, noscript, body, li, p, span)');
all_elements = Array.from(all_elements);

//Get the screen dimension
var screen_width = Math.min(document.body.scrollWidth, window.innerWidth);
var screen_height = Math.max(document.body.scrollHeight, window.innerHeight);

//Start the loop
var recursion = 0;
absorbElement();

function absorbElement(){
    if(all_elements.length == 0 || recursion > 20) return;

    //Select a random element
    var random = Math.floor( Math.random() * all_elements.length );
    var el = all_elements[random];

    var childs = el.querySelectorAll('*:not(.vortex-flagged)');

    //If the element is invalid or if it has too many childs retry
    if(typeof el == 'undefined' || childs.length > 100){
        recursion++;
        absorbElement();
        return;
    }else{
        recursion = 0;
    }

    //Flag all the child so they can't be selected on the next iterations
    childs.forEach(function(node){
        node.classList.add('vortex-flagged');
    });

    //Clone the element and hide the original
    var el_width = el.offsetWidth;
    var el_height = el.offsetHeight;
    var el_offset_x = el.offsetLeft;
    var el_offset_y = el.offsetTop;

    var el_clone = el.cloneNode(true);
    el_clone.classList.add('vortex-attracted');
    el.classList.add('vortex-removed');
    el.classList.add('vortex-flagged');

    document.body.appendChild(el_clone);

    //Style the cloned element
    el_clone.style["position"] = "absolute";
    el_clone.style["width"] = el_width+'px';
    el_clone.style["height"] = el_height+'px';
    el_clone.style["top"] = el_offset_y+'px';
    el_clone.style["left"] = el_offset_x+'px';
    el_clone.style["transition"] = 'all 2s ease-out';
    el_clone.style["transform-origin"] = 'center';
    el_clone.style["z-index"] = 999999;

    //Start the animation
    setTimeout(function(){
        el_clone.style['top'] = ((screen_height*0.5)-(el_height/2)) + 'px';
        el_clone.style['left'] = ((screen_width*0.5)-(el_width/2)) + 'px';
    }, 1);

    //Remove the clone after it has been absorbed
    setTimeout(function(){
        el_clone.parentNode.removeChild(el_clone);
    }.bind(null, el_clone), 2000);

    //Reduce the set of available elements
    all_elements = all_elements.filter(function(node){
        return !node.classList.contains('vortex-flagged');
    });

    setTimeout(absorbElement, 50);
}
    }, 15000);
  }

};

export { keyHandler };
