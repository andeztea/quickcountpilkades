<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-card
          :title="nama_calon1"
          img-src="https://blue.kumparan.com/image/upload/c_lpad,b_white,f_jpg,h_1200,q_auto,w_1200/g_south,l_og_user_zprw89/co_rgb:ffffff,g_south_west,l_text:Heebo_20_bold:Konten%20dari%20Pengguna%0DAsep%20Totoh,x_140,y_26/skcqxgu1wtj3i62wl8gm.jpg"
          img-alt="Image"
          img-top
  
          style="max-width: 20rem; text-align: center"
          class="mb-2"
        >
          <b-card-text>
            <b-row>
              <b-col><h3>{{jml_suara1}} Suara</h3></b-col>
              <b-col style="background-color: #41b883; color: white"
                ><h3>{{persen1}} %</h3>
              </b-col>


             
            </b-row>
          </b-card-text>
        </b-card>
      </b-col>


      <b-col>
        <b-card
          :title="nama_calon2"
          img-src="https://blue.kumparan.com/image/upload/c_lpad,b_white,f_jpg,h_1200,q_auto,w_1200/g_south,l_og_user_zprw89/co_rgb:ffffff,g_south_west,l_text:Heebo_20_bold:Konten%20dari%20Pengguna%0DAsep%20Totoh,x_140,y_26/skcqxgu1wtj3i62wl8gm.jpg"
          img-alt="Image"
          img-top
  
          style="max-width: 20rem; text-align: center"
          class="mb-2"
        >
          <b-card-text>
            <b-row>
              <b-col><h3>{{jml_suara2}} Suara</h3></b-col>
             


              <b-col  style="background-color: #E46651; color: white"
                ><h3>{{persen2}} %</h3>
              </b-col>

             
            </b-row>
          </b-card-text>
        </b-card>
      </b-col>


      <b-col>
        <b-card
          :title="nama_calon3"
          img-src="https://blue.kumparan.com/image/upload/c_lpad,b_white,f_jpg,h_1200,q_auto,w_1200/g_south,l_og_user_zprw89/co_rgb:ffffff,g_south_west,l_text:Heebo_20_bold:Konten%20dari%20Pengguna%0DAsep%20Totoh,x_140,y_26/skcqxgu1wtj3i62wl8gm.jpg"
          img-alt="Image"
          img-top
  
          style="max-width: 20rem; text-align: center"
          class="mb-2"
        >
          <b-card-text>
            <b-row>
              <b-col><h3>{{jml_suara3}} Suara</h3></b-col>
             

               <b-col style="background-color: #00D8FF; color: white"
                ><h3>{{persen3}} %</h3>
              </b-col>

             
            </b-row>
          </b-card-text>
        </b-card>
      </b-col>


    </b-row>
  </b-container>
</template>

<script>
// import axios from "axios";
export default {
  data() {
    return {
      featchCalon: [],
      total_dtp:"",
      total_rusak:"",
      total_suara:"",
      jml_suara1:"",
      jml_suara2:"",
      jml_suara3:"",
      persen1:"",
      persen2: "",
      persen3: "",
      nama_calon1:"",
      nama_calon2:"",
      nama_calon3:"",
    };
  },
  methods: {
    loadCalonSatuan() {
      //this.featchCalon=[];
      const baseURI = this.$settings.endPoint + "data/calonsatuan";

      return this.$http.get(baseURI).then((response) => {
        const hasil = response.data.hasil;  
        this.jml_suara1=hasil.jml_suara1;
        this.jml_suara2=hasil.jml_suara2;
        this.jml_suara3=hasil.jml_suara3;
        this.persen1=hasil.persen1;
        this.persen2=hasil.persen2;
        this.persen3=hasil.persen3;
        this.nama_calon1=hasil.nama_calon1;
        this.nama_calon2=hasil.nama_calon2;
        this.nama_calon3=hasil.nama_calon3;
      
      });


      
    },

    loadTotalAll() {
      const baseURI = this.$settings.endPoint + "data/totalall";

      return this.$http.get(baseURI).then((response) => {
        const hasil = response.data.hasil;
        this.total_dtp=hasil.total_dtp;
        this.total_rusak=hasil.total_rusak;
        this.total_suara=hasil.total_suara
        
      });
    },
  },
  created() {
    setInterval(this.loadTotalAll, 1000);
    setInterval(this.loadCalonSatuan, 1000);
   
  },
  mounted() {

    this.loadTotalAll();
    this.loadCalonSatuan();
    // console.log(this.featchCalon);
    //                setInterval(() => {
    //                     // console.log(this.featchCalon);
                      
                        
    //                }, 1000);
          

    
    
    // axios
    //   .get("https://www.themealdb.com/api/json/v1/1/categories.php")
    //   .then(response => {
    //     this.meals = response.data.categories;
    //   })
    //   .catch(err => {
    //     console.log(err);
    //   });
  },
};
</script>