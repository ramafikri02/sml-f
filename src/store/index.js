import Vue from 'vue'
import Vuex from 'vuex'

// Modules
import ecommerceStoreModule from '@/views/apps/e-commerce/eCommerceStoreModule'
import app from './app'
import appConfig from './app-config'
import verticalMenu from './vertical-menu'

// *--------- Master Data ---------------------------------------*
import user from './module/master-data/user/user'

import role from './module/master-data/system/roles-mapping'

import branch from './module/master-data/organization/branch'
import employee from './module/master-data/organization/employee'
import coverage_area from './module/master-data/organization/coverage-area'
import courier from './module/master-data/organization/courier'
import helper from './module/master-data/organization/helper'
import vehicle from './module/master-data/organization/vehicle'
import pic_invoice from './module/master-data/organization/pic-invoice'

import vendor from './module/master-data/vendor/vendor'
import customer from './module/master-data/customer/customer-data'
import customer_contract from './module/master-data/customer/customer-contract'

// *--------- Pick Up ---------------------------------------*
import pickup_request from './module/pickup/pickup-order/pickup-request'


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
    helper,
    vehicle,
    pic_invoice,
    vendor,
    customer,
    customer_contract,
    pickup_request,
    'app-ecommerce': ecommerceStoreModule,
  },
  strict: process.env.DEV,
})
