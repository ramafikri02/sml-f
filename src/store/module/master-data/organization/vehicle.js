import queryString from 'query-string'

import {
  GET_VEHICLE,
  GET_VEHICLE_BY_ID,
  ADD_VEHICLE,
  UPDATE_VEHICLE,
  DELETE_VEHICLE,
} from '../../../../api/master-data/organization/vehicle'

export default {
  namespaced: true,
  state: {
    vehicle: null,
    vehicleById: null,
    resp: null,
  },
  getters: {
    getsVehicle: state => state.vehicle,
    getsVehicleById: state => state.vehicleById,
  },
  mutations: {
    SET_VEHICLE: (state, payload) => {
      state.vehicle = payload
    },
    SET_VEHICLE_BY_ID: (state, payload) => {
      state.vehicleById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_VEHICLE: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_VEHICLE(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_VEHICLE', resp.data.data)
          }
      })
    },
    GET_VEHICLE_BY_ID: async ({ commit }, id) => {
      return await GET_VEHICLE_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_VEHICLE_BY_ID', resp.data.data)
          }
      })
    },
    ADD_VEHICLE: async ({ commit }, args) => {
      await ADD_VEHICLE(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_VEHICLE: async ({ commit }, args) => {
      await UPDATE_VEHICLE(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_VEHICLE: async ({ commit }, id) => {
      await DELETE_VEHICLE(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
