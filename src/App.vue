<template>
 
    <div id="app">
      
      <Headers/>

      
      <Content/>
      
      <DougnutChart/>

      <Footers/>
    </div>
   

</template>

<script>


import Headers from './components/Header.vue';
import Content from './components/Content.vue';
import DougnutChart from './components/Doughnut.vue';
import Footers from './components/Footers.vue';

export default {
  name: 'App',
  components: {
    Headers,
    Content,
    DougnutChart,
    Footers
  }
}
</script>


