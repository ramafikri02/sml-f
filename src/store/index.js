import Vue from 'vue'
import Vuex from 'vuex'

// Modules
import ecommerceStoreModule from '@/views/apps/e-commerce/eCommerceStoreModule'
import app from './app'
import appConfig from './app-config'
import verticalMenu from './vertical-menu'
import user from './module/master-data/user/user'
import role from './module/master-data/system/roles-mapping'
import branch from './module/master-data/organization/branch'
import employee from './module/master-data/organization/employee'
import coverage_area from './module/master-data/organization/coverage-area'
import courier from './module/master-data/organization/courier'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    app,
    appConfig,
    verticalMenu,
    user,
    role,
    branch,
    employee,
    coverage_area,
    courier,
    'app-ecommerce': ecommerceStoreModule,
  },
  strict: process.env.DEV,
})
