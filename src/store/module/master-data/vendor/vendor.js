import queryString from 'query-string'

import {
  GET_VENDOR,
  GET_VENDOR_BY_ID,
  ADD_VENDOR,
  UPDATE_VENDOR,
  DELETE_VENDOR,
} from '../../../../api/master-data/vendor/vendor'

export default {
  namespaced: true,
  state: {
    vendor: null,
    vendorById: null,
    resp: null,
  },
  getters: {
    getsVendor: state => state.vendor,
    getsVendorById: state => state.vendorById,
  },
  mutations: {
    SET_VENDOR: (state, payload) => {
      state.vendor = payload
    },
    SET_VENDOR_BY_ID: (state, payload) => {
      state.vendorById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_VENDOR: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_VENDOR(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_VENDOR', resp.data.data)
          }
      })
    },
    GET_VENDOR_BY_ID: async ({ commit }, id) => {
      return await GET_VENDOR_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_VENDOR_BY_ID', resp.data.data)
          }
      })
    },
    ADD_VENDOR: async ({ commit }, args) => {
      await ADD_VENDOR(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_VENDOR: async ({ commit }, args) => {
      await UPDATE_VENDOR(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_VENDOR: async ({ commit }, id) => {
      await DELETE_VENDOR(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
