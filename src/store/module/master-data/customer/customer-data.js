import queryString from 'query-string'

import {
  GET_CUSTOMER,
  SEARCH_CUSTOMER,
  GET_CUSTOMER_BY_ID,
  ADD_CUSTOMER,
  UPDATE_CUSTOMER,
  DELETE_CUSTOMER,
} from '../../../../api/master-data/customer/customer'

export default {
  namespaced: true,
  state: {
    customer: null,
    customerById: null,
    resp: null,
  },
  getters: {
    getsCustomer: state => state.customer,
    getsCustomerById: state => state.customerById,
  },
  mutations: {
    SET_CUSTOMER: (state, payload) => {
      state.customer = payload
    },
    SET_CUSTOMER_BY_ID: (state, payload) => {
      state.customerById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_CUSTOMER: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_CUSTOMER(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_CUSTOMER', resp.data.data)
          }
      })
    },
    SEARCH_CUSTOMER: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await SEARCH_CUSTOMER(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_CUSTOMER', resp.data.data)
          }
      })
    },
    GET_CUSTOMER_BY_ID: async ({ commit }, id) => {
      return await GET_CUSTOMER_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_CUSTOMER_BY_ID', resp.data.data)
          }
      })
    },
    ADD_CUSTOMER: async ({ commit }, args) => {
      await ADD_CUSTOMER(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_CUSTOMER: async ({ commit }, args) => {
      await UPDATE_CUSTOMER(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_CUSTOMER: async ({ commit }, id) => {
      await DELETE_CUSTOMER(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
