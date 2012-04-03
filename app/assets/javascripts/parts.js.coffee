class @Parts
  constructor: ->
    @canvas = document.getElementById("main")
    @context = @canvas.getContext("2d");
    @context.strokeStyle = "lime"
  
  @parse_json: (object)-> new Parts()
  
  draw: -> 

class @Background extends Parts
  constructor: (@width,@height) ->
    super()
    
  @parse_json: (object) ->
    new Background(object.width, object.height)
    
  draw: ->
    @resize_canvas();
    @context.fillStyle="black"
    @context.strokeStyle="gray"
    @context.rect(0,0,@width,@height);
    @context.fill();
    @context.stroke();
    
  resize_canvas: ->
    @canvas.width = @width
    @canvas.height = @height
    $("#canvas_container").css("width", @width)
    
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
  
  @parse_json: (object)->
    new Circle(object.center, oject.radius)
  
  draw: -> 
    @context.beginPath();
    @context.arc(@center.x,@center.y,@radius,0,2*Math.PI, false);
    @context.stroke();
    
class @Arc extends Parts
  constructor: (@center, @radius, @start_angle, @end_angle) ->
    super()
  
  @parse_json: (object)->
    new Arc(object.center, object.radius, object.start_angle, object.end_angle)
  
  draw: ->
    start_rad = deg_to_rad(@start_angle)
    end_rad = deg_to_rad(@end_angle)
    @context.beginPath();
    @context.moveTo(@center.x , @center.y)
    @context.lineTo(@center.x + @radius * Math.cos(start_rad), @center.y + @radius * Math.sin(start_rad))
    @context.arc(@center.x, @center.y, @radius, deg_to_rad(@start_angle), deg_to_rad(@end_angle),false)
    @context.moveTo(@center.x, @center.y)
    @context.lineTo(@center.x + @radius * Math.cos(end_rad), @center.y + @radius * Math.sin(end_rad))
    @context.stroke();

class @DounutsArc extends Parts
  constructor: (@center, @radius,@width,@start_angle, @end_angle) ->
    super()
    
  @parse_json: (object) ->
    new DounutsArc(object.center, object.radius,object.width, object.start_angle, object.end_angle)
       
  draw: ->
    start_rad = deg_to_rad(@start_angle)
    end_rad = deg_to_rad(@end_angle)
    @context.beginPath();
    @context.arc(@center.x, @center.y, @radius, deg_to_rad(@start_angle), deg_to_rad(@end_angle),false)
    start_x = @center.x + @radius * Math.cos(start_rad)
    start_y = @center.y + @radius * Math.sin(start_rad)
    @context.moveTo(start_x, start_y)
    @context.lineTo(start_x + @width * Math.cos(start_rad), start_y + @width * Math.sin(start_rad))
    @context.arc(@center.x, @center.y, @radius + @width, deg_to_rad(@start_angle), deg_to_rad(@end_angle),false)
    end_x = @center.x + @radius * Math.cos(end_rad)
    end_y = @center.y + @radius * Math.sin(end_rad)
    @context.moveTo(end_x, end_y)
    @context.lineTo(end_x + @width * Math.cos(end_rad), end_y + @width * Math.sin(end_rad))
    @context.stroke();
  
class @Cylinder extends Parts
  constructor: (@location,@radius,@length,@angle) ->
    super()
    
  @parse_json: (object)->
    new Cylinder(object.location,object.radius,object.length,object.angle)
    
  draw: ->
    @context.save()    
    @context.translate(@location.x,@location.y)
    @context.rotate(deg_to_rad(@angle))
    new Rectangle({x:0,y: -@radius},@length,@radius*2).draw()
    @context.restore()
    
class @CurvedCylinder extends Parts
  constructor: (@location,@radius,@curve_radius, @degree,@angle,@rotation) ->
    super();
        
  @parse_json: (object)->
    new CurvedCylinder(object.location,object.radius,object.curve_radius, object.degree,object.angle,object.rotation)

  draw: ->
    @angle = @angle + 180 if @rotation
    @context.save()    
    @context.translate(@location.x,@location.y)
    @context.rotate(deg_to_rad(@angle-90))
    center = {x:-(@radius+@curve_radius),y:0}
    start_angle = if @rotation then -@degree else 0
    end_angle = if @rotation then 0 else @degree
    new DounutsArc(center,@curve_radius,@radius*2,start_angle,end_angle).draw()
    @context.restore()
    
class @Pipe extends Parts
  constructor: (@points,@radius,@curve_radius) ->
    super()
    
  @parse_json: (object)->
    new Pipe(object.points,object.radius,object.curve_radius)
    
  draw: ->
    alpha = angle(@points[0],@points[1])
    l = length(@points[0],@points[1])
    new Cylinder(@points[0],@radius,l,rad_to_deg(alpha)).draw()
    # beta = angle(@points[1],@points[2])
    # l = length(@points[1],@points[2])
    # new Cylinder(@points[1],@radius,l,rad_to_deg(beta)).draw()

    # alpha = angle(@points[0],@points[1])
    # beta = angle(@points[1],@points[2])
    # length1 = length(@points[0],@points[1])- (@radius + @curve_radius)/Math.tan((alpha+beta)/2)
    # new Cylinder(@points[0],@radius,length1,0).draw()
    # point = {x:@points[1].x - length1* Math.cos(alpha), y:@points[1].y - length1*Math.sin(alpha)}
    # new CurvedCylinder(point,@radius,@curve_radius,90,0,0).draw()
    
deg_to_rad = (deg)->
  return deg * Math.PI /180

rad_to_deg = (rad) ->
  return rad * 180 / Math.PI
  
length = (point1,point2) ->
  return Math.sqrt((point2.x - point1.x) * (point2.x - point1.x) + (point2.y - point1.y) * (point2.y - point1.y))

angle = (point1,point2) ->
  _x = point2.x - point1.x
  _x = 1 if _x == 0
  _y = point2.y - point1.y
  alpha = Math.atan(_y/_x)
  
