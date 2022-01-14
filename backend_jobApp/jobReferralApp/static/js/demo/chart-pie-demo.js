
// Pie Chart Example
function pieChart(id, label=[], data=[], color=[], hoverColor=[]){
    var ctx = document.getElementById(id).getContext('2d');;
    var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: label,
            datasets: [{
              data: data,
              backgroundColor: color,
              hoverBackgroundColor: hoverColor,
              hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 80,
          },
    });
    }
