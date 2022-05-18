import Vue from 'vue'

// axios
import axios from 'axios'

const axiosIns = axios.create({
  // You can add your headers here
  // ================================
  baseURL: 'http://localhost:9999/api/',
  // timeout: 1000,
  // headers: { 'X-Custom-Header': 'foobar' },
  // headers: { 'x-access-token': `Bearer ${localStorage.getItem('accessToken')}` },
})

Vue.prototype.$http = axiosIns

export default axiosIns
