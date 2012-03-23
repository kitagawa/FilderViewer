class @Parts
  constructor: ->
    @context = document.getElementById("main").getContext("2d");
    @context.strokeStyle = "lime"
  
  @parse_json: -> new Parts()
  
  draw: -> 

class @Rectangle extends Parts    
  constructor: (@location,@width,@height) ->
    super()

  @parse_json: (object)->
    new Rectangle(object.location,object.width,object.height)

  draw: -> 
    @context.beginPath();
    @context.rect(@location.x,@location.y,@width,@height);
    @context.stroke();

class @Circle extends Parts
  constructor: (@center, @radius) -> 
    super()
  
  @parse_json: ->
    new Circle(object.center, oject.radius)
  
  draw: -> 
    @context.beginPath();
    @context.arc(@center.x,@center.y,@radius,0,2*Math.PI, false);
    @context.stroke();
    
class @Cylinder extends Parts
