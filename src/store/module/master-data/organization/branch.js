import queryString from 'query-string'

import {
  GET_BRANCH,
  GET_BRANCH_BY_ID,
  ADD_BRANCH,
  UPDATE_BRANCH,
  DELETE_BRANCH,
} from '../../../../api/master-data/organization/branch'

export default {
  namespaced: true,
  state: {
    branch: null,
    branchById: null,
    resp: null,
  },
  getters: {
    getsBranch: state => state.branch,
    getsBranchById: state => state.branchById,
  },
  mutations: {
    SET_BRANCH: (state, payload) => {
      state.branch = payload
    },
    SET_BRANCH_BY_ID: (state, payload) => {
      state.branchById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_BRANCH: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_BRANCH(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_BRANCH', resp.data.data)
          }
      })
    },
    GET_BRANCH_BY_ID: async ({ commit }, id) => {
      return await GET_BRANCH_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_BRANCH_BY_ID', resp.data.data)
          }
      })
    },
    ADD_BRANCH: async ({ commit }, args) => {
      await ADD_BRANCH(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_BRANCH: async ({ commit }, args) => {
      await UPDATE_BRANCH(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_BRANCH: async ({ commit }, id) => {
      await DELETE_BRANCH(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
