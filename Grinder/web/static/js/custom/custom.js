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

/*
	Handle the filters for statistical data
*/
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