class @Canvas
  constructor: (@data) ->
    
  draw: ()->
    data = @data
    for class_name of data
      for i of data[class_name]
        eval(class_name + ".parse_json(data[class_name][i]).draw()");
