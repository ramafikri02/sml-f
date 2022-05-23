import queryString from 'query-string'

import {
  GET_HELPER,
  GET_HELPER_BY_ID,
  ADD_HELPER,
  UPDATE_HELPER,
  DELETE_HELPER,
} from '../../../../api/master-data/organization/helper'

export default {
  namespaced: true,
  state: {
    helper: null,
    helperById: null,
    resp: null,
  },
  getters: {
    getsHelper: state => state.helper,
    getsHelperById: state => state.helperById,
  },
  mutations: {
    SET_HELPER: (state, payload) => {
      state.helper = payload
    },
    SET_HELPER_BY_ID: (state, payload) => {
      state.helperById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_HELPER: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_HELPER(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_HELPER', resp.data.data)
          }
      })
    },
    GET_HELPER_BY_ID: async ({ commit }, id) => {
      return await GET_HELPER_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_HELPER_BY_ID', resp.data.data)
          }
      })
    },
    ADD_HELPER: async ({ commit }, args) => {
      await ADD_HELPER(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_HELPER: async ({ commit }, args) => {
      await UPDATE_HELPER(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_HELPER: async ({ commit }, id) => {
      await DELETE_HELPER(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
