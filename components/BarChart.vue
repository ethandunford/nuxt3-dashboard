<script>
import { Bar } from "vue-chartjs";
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
} from "chart.js";

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
);

export default {
  name: "BarChart",
  components: { Bar },
  data() {
    return {
      chartData: {
        labels: [
          "January",
          "February",
          "March",
          "April",
          "May",
          "June",
          "July",
          "August",
          "September",
          "October",
          "November",
          "December",
        ],
        datasets: [
          {
            label: "Total Sales",
            backgroundColor: "#22C55E",
            data: [40, 20, 12, 60, 55, 70, 120, 100, 40, 80, 65, 85],
          },
        ],
      },
      chartOptions: {
        responsive: true,
      },
    };
  },
};
</script>
<template>
  <Bar class="bar-chart" :options="chartOptions" :data="chartData" />
</template>
<style scss>
.bar-chart {
  width: 100% !important;
}
</style>
