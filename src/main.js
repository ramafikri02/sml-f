import Vue from 'vue'
import { ToastPlugin, ModalPlugin } from 'bootstrap-vue'
import VueCompositionAPI from '@vue/composition-api'
import { localize } from 'vee-validate';
import id from 'vee-validate/dist/locale/id.json';
import JsonExcel from "vue-json-excel";
import { extend  } from "vee-validate";

localize('id', id);

// import i18n from '@/libs/i18n'
import router from './router'
import store from './store'
import App from './App.vue'

// Global Components
import './global-components'

// 3rd party plugins
import '@axios'
import '@/libs/acl'
import '@/libs/portal-vue'
import '@/libs/clipboard'
import '@/libs/toastification'
import '@/libs/sweet-alerts'
import '@/libs/vue-select'
import '@/libs/tour'

// Axios Mock Adapter
import '@/@fake-db/db'

// BSV Plugin Registration
Vue.use(ToastPlugin)
Vue.use(ModalPlugin)

// Composition API
Vue.use(VueCompositionAPI)

Vue.component("downloadExcel", JsonExcel);

Vue.directive('uppercase', {
  bind(el, _, vnode) {
    el.addEventListener('input', (e) => {
      e.target.value = e.target.value.toUpperCase()
      vnode.componentInstance.$emit('input', e.target.value.toUpperCase())
    })
  },
})

Vue.directive('lowercase', {
  bind(el, _, vnode) {
    el.addEventListener('input', (e) => {
      e.target.value = e.target.value.toLowerCase()
      vnode.componentInstance.$emit('input', e.target.value.toLowerCase())
    })
  },
})

extend ('required', value => {
  if (!value || !value.length) {
    return 'This field is required';
  }
  return true;
});
extend ('email', value => {
  // Field is empty, should pass
  if (!value || !value.length) {
    return true;
  }
  // Check if email
  if (!/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/.test(value)) {
    return 'This field must be a valid email';
  }
  return true;
});
extend('minMax', (value, [min, max]) => {
  // The field is empty so it should pass
  if (!value || !value.length) {
    return true;
  }
  const numericValue = Number(value);
  if (numericValue < min) {
    return `This field must be greater than ${min}`;
  }
  if (numericValue > max) {
    return `This field must be less than ${max}`;
  }
  return true;
});

// Feather font icon - For form-wizard
// * Shall remove it if not using font-icons of feather-icons - For form-wizard
require('@core/assets/fonts/feather/iconfont.css') // For form-wizard

// import core styles
require('@core/scss/core.scss')

// import assets styles
require('@/assets/scss/style.scss')

Vue.config.productionTip = false

new Vue({
  router,
  store,
  // i18n,
  render: h => h(App),
}).$mount('#app')
