function Last7Days () {
  return '0123456'.split('').map(function(n) {
      var d = new Date();
      d.setDate(d.getDate() - n);

      return (function(day, month, year) {
          return [day<10 ? '0'+day : day, month<10 ? '0' + (month+1) : (month+1), year].join('-');
      })(d.getDate(), d.getMonth(), d.getFullYear());
  });
}

function getRandom(){
  var num=Math.random();
  if(num < 0.3) return Math.floor(Math.random() * 3);  //probability 0.3
  else if(num < 0.7) return Math.floor(Math.random() * 5); // probability 0.4
  else if(num < 0.9) return Math.floor(Math.random() * 10); //probability 0.3
  else return Math.floor(Math.random() * 30);  //probability 0.1
}

const price = parseInt(document.querySelector('.best-price .price').innerText.slice(0, -1))

const labels = [
  Last7Days()[6],
  Last7Days()[5],
  Last7Days()[4],
  Last7Days()[3],
  Last7Days()[2],
  Last7Days()[1],
  Last7Days()[0]
];

const value = price + getRandom() - getRandom();
const value2 = value + getRandom() - getRandom();
const value3 = value2 + getRandom() - getRandom();
const value4 = value3 + getRandom() - getRandom();
const value5 = value4 + getRandom() - getRandom();
const value6 = value5 + getRandom() - getRandom();

const data = {
  labels: labels,
  datasets: [{
    backgroundColor: 'rgb(255, 99, 132)',
    borderColor: 'rgb(255, 99, 132)',
    data: [value6, value5, value4, value3, value2, value, price],
  }]
};
const config = {
  type: 'line',
  data: data,
  options: {
    responsive: true,
    maintainAspectRatio: false,
    layout: {
      padding: 40
    },
    plugins: {
      legend: false // Hide legend
    },
    scales: {
      y: {
          suggestedMin: price - 50,
          suggestedMax: price + 50
      }
    }
}
};
const options = {
  "responsive": true,
  "maintainAspectRatio": false
}
const myChart = new Chart(
  document.getElementById('myChart'),
  config
);
