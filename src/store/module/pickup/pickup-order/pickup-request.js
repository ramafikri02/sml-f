import queryString from 'query-string'

import {
  GET_PICKUP_ORDER,
  GET_PICKUP_ORDER_BY_ID,
  ADD_PICKUP_ORDER,
  UPDATE_PICKUP_ORDER,
  DELETE_PICKUP_ORDER,
} from '../../../../api/pickup/pickup-order/pickup-request'

export default {
  namespaced: true,
  state: {
    pickupOrder: null,
    pickupOrderById: null,
    resp: null,
  },
  getters: {
    getsPickupOrder: state => state.pickupOrder,
    getsPickupOrderById: state => state.pickupOrderById,
  },
  mutations: {
    SET_PICKUP_ORDER: (state, payload) => {
      state.pickupOrder = payload
    },
    SET_PICKUP_ORDER_BY_ID: (state, payload) => {
      state.pickupOrderById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_PICKUP_ORDER: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_PICKUP_ORDER(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_PICKUP_ORDER', resp.data.data)
          }
      })
    },
    GET_PICKUP_ORDER_BY_ID: async ({ commit }, id) => {
      return await GET_PICKUP_ORDER_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_PICKUP_ORDER_BY_ID', resp.data.data)
          }
      })
    },
    ADD_PICKUP_ORDER: async ({ commit }, args) => {
      await ADD_PICKUP_ORDER(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_PICKUP_ORDER: async ({ commit }, args) => {
      await UPDATE_PICKUP_ORDER(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_PICKUP_ORDER: async ({ commit }, id) => {
      await DELETE_PICKUP_ORDER(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
