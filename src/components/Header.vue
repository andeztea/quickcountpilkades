<template>
  <div>
    <b-navbar toggleable="lg" type="light" variant="info">
      <b-container>
        <b-navbar-brand href="#"
          >Quick Count Pilkades 2022 : Desa Pawenang  | <b-badge variant="info" style="font-size:large">{{timestamp}}</b-badge>
          </b-navbar-brand
        >
        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
        <b-collapse id="nav-collapse" is-nav>
          <!-- Right aligned nav items -->
          <b-navbar-nav class="ml-auto"> </b-navbar-nav>
        </b-collapse>
      </b-container>
    </b-navbar>
  </div>
</template>
<script>
export default {
  data() {
    return {
      timestamp: ""
    };
  },
  created() {
    setInterval(this.getNow, 1000);
  },
  methods: {
    getNow() {
      const today = new Date();
      const date =
        today.getDate() + "/" + today.getMonth() + "/" + today.getFullYear();
        
      const time =
        today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
      const dateTime = date + " " + time;
      this.timestamp = dateTime;
    },
  },
};
</script>
