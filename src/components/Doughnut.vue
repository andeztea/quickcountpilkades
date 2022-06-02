<template>
 <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
         <Doughnut
            :chart-options="chartOptions"
            :chart-data="chartData"
            :chart-id="chartId"
            :dataset-id-key="datasetIdKey"
            :plugins="plugins"
            :css-classes="cssClasses"
            :styles="styles"
            :width="width"
            :height="height"
          />
      </b-col>

      <b-col>
        <b-row>
          <b-col>
            <b-card
                title="Total DPT"
                style="max-width: 20rem; text-align: center;"
                class="mb-2"
              >
                <b-card-text>
                  <h3>{{total_dtp}}</h3>
                </b-card-text>

              </b-card>
          </b-col>
           <b-col>
              <b-card
                title="Suara Masuk"
                style="max-width: 20rem; text-align: center;"
                class="mb-2"
              >
                <b-card-text>
                  <h3>{{total_suara}}</h3>
                </b-card-text>

              </b-card>
           </b-col>
           <b-col>
              <b-card
                title="Tidak Sah"
                style="max-width: 20rem; text-align: center;"
                class="mb-2"
              >
                <b-card-text>
                  <h3>{{total_rusak}}</h3>
                </b-card-text>

              </b-card>
           </b-col>
        </b-row>
        <TableComponent/>
      </b-col>
    </b-row>

  </b-container>
 
</template>

<script>
import { Doughnut } from 'vue-chartjs/legacy'
import TableComponent from '../components/Tables.vue';

import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  ArcElement,
  CategoryScale
} from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, ArcElement, CategoryScale)

export default {
  name: 'DoughnutChart',
  components: {
    Doughnut,
    TableComponent
  },
  props: {
    chartId: {
      type: String,
      default: 'doughnut-chart'
    },
    datasetIdKey: {
      type: String,
      default: 'label'
    },
    width: {
      type: Number,
      default: 200
    },
    height: {
      type: Number,
      default: 400
    },
    cssClasses: {
      default: '',
      type: String
    },
    styles: {
      type: Object,
      default: () => {}
    },
    plugins: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      total_dtp:"",
      total_rusak:"",
      total_suara:"",
      chartData:[],
      chartOptions: {
        responsive: true,
        maintainAspectRatio: false
      }
    }
  },
  methods: {
   
    loadTotalAll() {
      const baseURI = this.$settings.endPoint + "data/totalall";

      return this.$http.get(baseURI).then((response) => {
        const hasil = response.data.hasil;
        this.total_dtp=hasil.total_dtp;
        this.total_rusak=hasil.total_rusak;
        this.total_suara=hasil.total_suara
        
      });
    },


    loadCalon() {
      const baseURI = this.$settings.endPoint + "data/calon";

      return this.$http.get(baseURI).then((response) => {
        const hasil = response.data.hasil;
        let dataAWal={
          labels: [],
          datasets: [
            {
              backgroundColor: ['#41B883', '#E46651', '#00D8FF'],
              data: []
            }
          ]
        }

        let percent=0;
        hasil.forEach((value) => {
            percent=(value.jml_suara/this.total_dtp)*100;           
            dataAWal.labels.push(value.nama_calon);
            dataAWal.datasets[0].data.push(percent);

        });
        this.chartData=dataAWal;
      });
    },


  },
  created() {
    setInterval(this.loadTotalAll, 1000);
    setInterval(this.loadCalon, 1000);
  },
  mounted() {
    this.loadTotalAll();
    this.loadCalon();
    
    
    // axios
    //   .get("https://www.themealdb.com/api/json/v1/1/categories.php")
    //   .then(response => {
    //     this.meals = response.data.categories;
    //   })
    //   .catch(err => {
    //     console.log(err);
    //   });
  },
}
</script>
