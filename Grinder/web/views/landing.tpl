<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Sweet Maria's Ground Truth Analysis</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="/static/css/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/static/css/custom/search.css" rel="stylesheet">
    <link href="/static/css/custom/toasty.css" rel="stylesheet">
    <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
    <link rel="stylesheet" href="https://rawgit.com/tpreusse/radar-chart-d3/master/src/radar-chart.css">
    <!--<link href="/static/css/custom/custom.css" rel="stylesheet">-->    
    
    <style>
    	.radar-chart .axis .legend {
    		font-size: 15px;
    	}
    </style>
  </head>

  <body>
  
  	<div class="container">
		<h1><a href="/">GroundTruth</a> :: Coffee Metrics</h1>
		<hr>
		
		<div class="col-md-12">
			
			<div class="col-md-3">
				% for i in l.keys()[0:12]:
					<h2>{{i}}</h2>
					% for item in l[i]:
						<a href="/coffee/{{item['aid']}}">{{item['name']}}</a><br>
					% end
				% end
			</div>
			
			<div class="col-md-3">
				% for i in l.keys()[12:20]:
					<h2>{{i}}</h2>
					% for item in l[i]:
						<a href="/coffee/{{item['aid']}}">{{item['name']}}</a><br>
					% end
				% end
			</div>
			
			<div class="col-md-3">
				% for i in l.keys()[20:33]:
					<h2>{{i}}</h2>
					% for item in l[i]:
						<a href="/coffee/{{item['aid']}}">{{item['name']}}</a><br>
					% end
				% end
			</div>
			
			<div class="col-md-3">
				% for i in l.keys()[33:]:
					<h2>{{i}}</h2>
					% for item in l[i]:
						<a href="/coffee/{{item['aid']}}">{{item['name']}}</a><br>
					% end
				% end
			</div>
			
		</div>
		
  		<div id="hidden" style="display: none;">
  		</div>
  		
    </div> <!-- /container -->

	<script src="http://d3js.org/d3.v3.js"></script>
	<script src="https://rawgit.com/tpreusse/radar-chart-d3/master/src/radar-chart.js"></script>
	<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.0.1/d3.v3.min.js"></script>-->
	<!--<script src="//cdnjs.cloudflare.com/ajax/libs/d3/3.4.12/d3.min.js"></script>-->
	<!--<script src="/static/js/d3/radar-chart-min.js"></script>-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.4.3/underscore-min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="/static/js/bootstrap/bootstrap.min.js"></script>
	<script src="/static/js/datatables/jquery.dataTables.js"></script>
	<script src="/static/js/datatables/dataTables.bootstrap.js"></script>
    
	<script src="/static/js/bootstrap/transition.js"></script>
	<script src="/static/js/bootstrap/alert.js"></script>
	<script src="/static/js/bootstrap/modal.js"></script>
	<script src="/static/js/bootstrap/dropdown.js"></script>
	<script src="/static/js/bootstrap/scrollspy.js"></script>
	<script src="/static/js/bootstrap/tab.js"></script>
	<script src="/static/js/bootstrap/tooltip.js"></script>
	<script src="/static/js/bootstrap/popover.js"></script>
	<script src="/static/js/bootstrap/button.js"></script>
	<script src="/static/js/bootstrap/collapse.js"></script>
	<script src="/static/js/bootstrap/carousel.js"></script>
	
	<script src="/static/js/typeahead/bloodhound.js"></script>
	<script src="/static/js/typeahead/typeahead.bundle.min.js"></script>
	<script src="/static/js/typeahead/handlebars.js"></script>	
  </body>
</html>