
// Bar Chart Example
//["January", "February", "March", "April", "May", "June"]
function barChar(id, label=[], data=[]){
  var ctx = document.getElementById(id).getContext('2d');;
var myBarChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: label,
    datasets: [{
      label: "count",
      backgroundColor: "#4e73df",
      hoverBackgroundColor: "#2e59d9",
      borderColor: "#4e73df",
      data: data,
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    gridLines: {
      color: "rgb(234, 236, 244)",
      zeroLineColor: "rgb(234, 236, 244)",
      drawBorder: false,
      borderDash: [2],
      zeroLineBorderDash: [2]
    }
  },
  legend: {
      display: false
    },
    tooltips: {
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
  });
  }
