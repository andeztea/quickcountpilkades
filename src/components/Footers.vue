<template>


<div class="footer">
  <b-container class="mt-2">
     <b-row>
              <!-- v-for="(a, index) of  featchCalon"
        :key="index" -->
        <b-col cols="2" md="auto"><h5>Pengumuman:</h5></b-col>
        <b-col cols="10"><h5><marquee > <span v-for="(a, index) of  items" :key="index">{{a.keterangan}} | </span></marquee>  </h5>
      </b-col>
    </b-row>
  </b-container>
</div> 
</template>

<style>
.footer {
  position: fixed;
  height: 80px;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: black;
  color: white;
  text-align: left;
}
</style>

<script>

export default ({
    name: 'TableComponent',
    data() {
    return {
      items:[],
    
    }
  },

  methods: {
    loadPengumuman() {
      const baseURI = this.$settings.endPoint + "data/pengumuman";

      return this.$http.get(baseURI).then((response) => {
        this.items = response.data.hasil;


      });
    },

   
  },
  created() {
     setInterval(this.loadPengumuman, 1000);
  },
  mounted() {
    this.loadPengumuman();
    

  },

})
</script>
