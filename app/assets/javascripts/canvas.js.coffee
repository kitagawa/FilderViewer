class @Canvas
  constructor: (@data) ->
    @canvas= document.getElementById("main")
    @context= @canvas.getContext("2d")
 
  draw: ()->
    data = @data
    for class_name of data
      for i of data[class_name]
        eval(class_name + ".parse_json(data[class_name][i]).draw()");

  draw_background: ()->
    @context.fillStyle="black"
    @context.rect(0,0,@canvas.width,@canvas.height);
    @context.fill();
