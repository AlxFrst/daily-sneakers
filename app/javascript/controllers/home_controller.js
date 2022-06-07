import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    function PureSlider(settings){

      /* vars */
      this.style = settings.style || "left";
      this.styleStates = settings.styleStates || ["0","-100%","100%"];
      this.el = settings.selector;
      this.current = 0;
    
    
      /* functions */
      this.getChildren = function(){
        return this.el.getElementsByTagName("div");
      },
      this.getLength = function(){
        return this.getChildren().length;
      },
      this.getOffset = function(dir){
        if(dir==="center") return this.styleStates[0]
        else if(dir==="left") return this.styleStates[1]
        else if(dir==="right") return this.styleStates[2];
      },
      this.slide = function(id, dir){
        dir = dir.split("=>");
        var start = this.getOffset(dir[0]);
        var end = this.getOffset(dir[1]);
        this.getChildren()[id].style.transition = "none";
        this.getChildren()[id].style[this.style] = start;
        var that = this;
        setTimeout(function(){
          that.getChildren()[id].style.transition = "";
          that.getChildren()[id].style[that.style] = end;
        }, 50);
      },
      this.prev = function(){
        if(this.current > 0){
          this.slide(this.current-1,"left=>center");
          this.slide(this.current,"center=>right");
          this.current--;
        }
        else{
          this.slide(this.getLength()-1,"left=>center");
          this.slide(this.current,"center=>right");
          this.current = this.getLength()-1;
        }
      },
      this.next = function(){
        if( this.current+1 < this.getLength()){
          this.slide(this.current+1,"right=>center");
          this.slide(this.current,"center=>left");
          this.current++;
        }
        else{
          this.slide(0,"right=>center");
          this.slide(this.current,"center=>left");
          this.current = 0;
        }
      }
    
    
      /* setup things */
      this.slide(0, "center=>center");
      for(var i = 1; i<this.getLength(); i++){
        this.slide(i, "right=>right");
      }
      
      var that = this;
      if(settings.timer){
        setInterval(function() {
          that.next();
        }, settings.timer*1000);
      } 
    }
    
    
    var slider1 = new PureSlider({
      selector: document.getElementById("slider"),
      timer: 5,
      // style: "opacity",
      // styleStates: ["1","0","0"]
    });
  }
}