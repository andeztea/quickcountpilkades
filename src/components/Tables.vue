<template>
     <b-table striped hover :items="items"></b-table>
</template>

<script>

export default ({
    name: 'TableComponent',
    data() {
    return {
      items: [],
    
    }
  },

  methods: {
    loadHasilTps() {
      const baseURI = this.$settings.endPoint + "data/hasiltps";

      return this.$http.get(baseURI).then((response) => {
        const hasil = response.data.hasil;
        this.items = [];
        hasil.forEach((value) => {

            var data={
              nama_tps:value.nama_tps,
              jml_dtp:value.jml_dtp,
              paslon_1:value.jml_suara_paslon1,
              paslon_2:value.jml_suara_paslon2,
              paslon_3:value.jml_suara_paslon3,
              jml_rusak:value.jml_rusak,
              jml_suara:value.jml_suara,
            }

           
            this.items.push(data);
        });

      });
    },

   
  },
  created() {
    setInterval(this.loadHasilTps, 1000);
  },
  mounted() {
    this.loadHasilTps();
    

  },

})
</script>
