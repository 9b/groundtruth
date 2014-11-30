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
		<h1><a href="/">GroundTruth</a> :: {{d['name']}}</h1>
		<hr>
		
		<div class="col-md-12">
		
			<div class="col-md-6">
				<h2 class="text-center">Total Cup Score: {{d['totalScore']}}</h2>
				<div id="chart"></div>
			</div>
			
			<div class="container">
			
				<div class="col-md-6">
					<h2>Feature Preference</h2>
				</div>
			
				<div class="col-md-2">
					<div class="checkbox">
					    <label><input type="checkbox" value="body"> Body</label>
					</div>
					<div class="checkbox">
					    <label><input type="checkbox" value="sweetness"> Sweetness</label>
					</div>
					<div class="checkbox">
					    <label><input type="checkbox" value="flavor"> Flavor</label>
					</div>
					<div class="checkbox">
					    <label><input type="checkbox" value="cupper_correction"> Cupper Correction</label>
					</div>
				</div>
				<div class="col-md-2">
					<div class="checkbox">
					    <label><input type="checkbox" value="dry_fragrance"> Dry Fragrance</label>
					</div>
					<div class="checkbox">
					    <label><input type="checkbox" value="wet_aroma"> Wet Aroma</label>
					</div>
					<div class="checkbox">
					    <label><input type="checkbox" value="complexity"> Complexity</label>
					</div>
					<div class="checkbox">
					    <label><input type="checkbox" value="clean_cup"> Clean Cup</label>
					</div>
				</div>
				<div class="col-md-2">
					<div class="checkbox">
					    <label><input type="checkbox" value="brightness"> Brightness</label>
					</div>
					<div class="checkbox">
					    <label><input type="checkbox" value="uniformity"> Uniformity</label>
					</div>
					<div class="checkbox">
					    <label><input type="checkbox" value="finish"> Finish</label>
					</div>
				</div>
				
				<div class="col-md-6">
					<hr>
					<h2>Similarity Index</h2>
					<div id="stats">
						
					</div>
				</div>
			</div>
				
		</div>
		
		<div class="col-md-12">
			<hr>
			<div class="col-md-4">
				<h2>Details</h2>
				<table class="table table-bordered table-condensed">
					<tr>
						<th>Sourced</th>
						<td>{{d['region']}} ({{d['country']}})</td>
					</tr>
					<tr>
						<th>Grade</th>
						<td>{{d['grade']}}</td>
					</tr>
					<tr>
						<th>Processing</th>
						<td>{{d['processing']}}</td>
					</tr>
					<tr>
						<th>Roast</th>
						<td>{{d['roast']}}</td>
					</tr>
					<tr>
						<th>Appearance</th>
						<td>{{d['appearance']}}</td>
					</tr>
					<tr>
						<th>Compare Notes</th>
						<td>{{d['compare']}}</td>
					</tr>
					<tr>
						<th>Intensity</th>
						<td>{{d['intensity']}}</td>
					</tr>
					<tr>
						<th>Variety</th>
						<td>{{d['varietal']}}</td>
					</tr>
				</table>
			</div>
			
			<div class="col-md-8">
				<h2>Description</h2>
				<p>{{d['description']}}</p>
			</div>
			
		</div>
		
  		<div id="hidden" style="display: none;">
  			<div id="articleId" aid="{{d['_id']}}"></div>
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
	
	<script>
		// handle the chart loading
		RadarChart.defaultConfig.radius = 3;
		RadarChart.defaultConfig.w = 500;
		RadarChart.defaultConfig.h = 500;
		RadarChart.defaultConfig.maxValue = 10;
		d = [[
			% forced = [ 'wet_aroma', 'sweetness', 'complexity', 'cupper_correction', 'dry_fragrance', 'body', 'flavor', 'clean_cup', 'brightness', 'uniformity', 'finish' ]
			% for item in forced:
				{ axis: "{{item}} ({{d['scores'][item]}})", value: {{d['scores'][item]}} },
			% end
		]];
		
		RadarChart.draw("#chart", d);
		
		function updateTable(checked) {
			var aid = $('#articleId').attr('aid');
			$.ajax({
				url: '/similar',
				type: 'post',
				dataType: 'json',
				contentType:'application/json',
				data: JSON.stringify({ aid: aid, f: checked }),
				success: function(data) {
					$('#stats').html(''); //clear the current data
					var t = '<table class="table table-bordered table-condensed"><thead><tr><th>Name</th><th>Similarity</th></tr></thead>';
					for (i=0; i < data.matches.length; i++) {
						var split = data.matches[i][0].split('___');
						t = t + '<tr><td><a href="/coffee/' + split[1] + '">' + split[0] + '</a></td><td>' + data.matches[i][1] + '</td>';
					}
					var t = t + '</table>'
					$('#stats').html(t);
				}
			}); //end of ajax
		}
		
		// Handle the filters for statistical data
		$('input[type="checkbox"]').change(function() {
		
			var checked = [];
			$('input[type="checkbox"]').each(function () {
				if (this.checked) {
			    	var val = $(this).val();
			    	checked.push(val);
				}
			});
			
			updateTable(checked);
		});
		
		updateTable([]);
	</script>
	
  </body>
</html>