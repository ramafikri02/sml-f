import queryString from 'query-string'

import {
  GET_COURIER,
  GET_COURIER_BY_ID,
  ADD_COURIER,
  UPDATE_COURIER,
  DELETE_COURIER,
} from '../../../../api/master-data/organization/courier'

export default {
  namespaced: true,
  state: {
    courier: null,
    courierById: null,
    resp: null,
  },
  getters: {
    getsCourier: state => state.courier,
    getsCourierById: state => state.courierById,
  },
  mutations: {
    SET_COURIER: (state, payload) => {
      state.courier = payload
    },
    SET_COURIER_BY_ID: (state, payload) => {
      state.courierById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_COURIER: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_COURIER(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_COURIER', resp.data.data)
          }
      })
    },
    GET_COURIER_BY_ID: async ({ commit }, id) => {
      return await GET_COURIER_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_COURIER_BY_ID', resp.data.data)
          }
      })
    },
    ADD_COURIER: async ({ commit }, args) => {
      await ADD_COURIER(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_COURIER: async ({ commit }, args) => {
      await UPDATE_COURIER(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_COURIER: async ({ commit }, id) => {
      await DELETE_COURIER(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
