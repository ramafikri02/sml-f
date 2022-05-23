import queryString from 'query-string'

import {
  GET_CUSTOMER_CONTRACT,
  GET_CUSTOMER_CONTRACT_BY_ID,
  ADD_CUSTOMER_CONTRACT,
  UPDATE_CUSTOMER_CONTRACT,
  DELETE_CUSTOMER_CONTRACT,
} from '../../../../api/master-data/customer/customer-contract'

export default {
  namespaced: true,
  state: {
    customerContract: null,
    customerContractById: null,
    resp: null,
  },
  getters: {
    getsCustomerContract: state => state.customerContract,
    getsCustomerContractById: state => state.customerContractById,
  },
  mutations: {
    SET_CUSTOMER_CONTRACT: (state, payload) => {
      state.customerContract = payload
    },
    SET_CUSTOMER_CONTRACT_BY_ID: (state, payload) => {
      state.customerContractById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_CUSTOMER_CONTRACT: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_CUSTOMER_CONTRACT(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_CUSTOMER_CONTRACT', resp.data.data)
          }
      })
    },
    GET_CUSTOMER_CONTRACT_BY_ID: async ({ commit }, id) => {
      return await GET_CUSTOMER_CONTRACT_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_CUSTOMER_CONTRACT_BY_ID', resp.data.data)
          }
      })
    },
    ADD_CUSTOMER_CONTRACT: async ({ commit }, args) => {
      await ADD_CUSTOMER_CONTRACT(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_CUSTOMER_CONTRACT: async ({ commit }, args) => {
      await UPDATE_CUSTOMER_CONTRACT(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_CUSTOMER_CONTRACT: async ({ commit }, id) => {
      await DELETE_CUSTOMER_CONTRACT(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
