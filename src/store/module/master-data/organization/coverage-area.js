import queryString from 'query-string'

import {
  GET_COVERAGE_AREA,
  GET_COVERAGE_AREA_BY_ID,
  ADD_COVERAGE_AREA,
  UPDATE_COVERAGE_AREA,
  DELETE_COVERAGE_AREA,
} from '../../../../api/master-data/organization/coverage-area'

export default {
  namespaced: true,
  state: {
    coverageArea: null,
    coverageAreaById: null,
    resp: null,
  },
  getters: {
    getsCoverageArea: state => state.coverageArea,
    getsCoverageAreaById: state => state.coverageAreaById,
  },
  mutations: {
    SET_COVERAGE_AREA: (state, payload) => {
      state.coverageArea = payload
    },
    SET_COVERAGE_AREA_BY_ID: (state, payload) => {
      state.coverageAreaById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_COVERAGE_AREA: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_COVERAGE_AREA(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_COVERAGE_AREA', resp.data.data)
          }
      })
    },
    GET_COVERAGE_AREA_BY_ID: async ({ commit }, id) => {
      return await GET_COVERAGE_AREA_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_COVERAGE_AREA_BY_ID', resp.data.data)
          }
      })
    },
    ADD_COVERAGE_AREA: async ({ commit }, args) => {
      await ADD_COVERAGE_AREA(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_COVERAGE_AREA: async ({ commit }, args) => {
      await UPDATE_COVERAGE_AREA(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_COVERAGE_AREA: async ({ commit }, id) => {
      await DELETE_COVERAGE_AREA(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
