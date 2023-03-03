import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

const app = createApp(App)

import 'bootstrap-icons/font/bootstrap-icons.css'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.min.js'


import './assets/template/style.css';
import './assets/template/responsive.css';
import './assets/template/ui-kit.css';
import './assets/template/default.css'


import './assets/main.css'
import 'animate.css';
import 'vue3-carousel/dist/carousel.css';

import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";
app.component('vSelect', vSelect);

import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

import ExportExcel from 'vue-3-export-excel'

import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'
app.component('VueDatePicker', VueDatePicker);

app.use(createPinia())
app.use(VueSweetalert2);
// @ts-ignore
app.use(ExportExcel);
app.use(router)

app.mount('#app')
