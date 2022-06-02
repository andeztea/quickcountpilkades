import Vue from 'vue'
import App from './App.vue'
import Axios from 'axios';
import moment from 'moment';
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import settings from './setting';

Vue.use(BootstrapVue)
Vue.config.productionTip = false

Vue.prototype.$http             = Axios;
Vue.prototype.$settings         = settings;
Vue.prototype.$moment           = moment;

new Vue({
  render: h => h(App),
}).$mount('#app')