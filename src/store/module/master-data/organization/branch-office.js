import queryString from 'query-string'

import {
  GET_BRANCH_OFFICE,
  GET_BRANCH_OFFICE_BY_ID,
  ADD_BRANCH_OFFICE,
  UPDATE_BRANCH_OFFICE,
  DELETE_BRANCH_OFFICE,
} from '../../../../api/master-data/organization/branch-office'

export default {
  namespaced: true,
  state: {
    branchOffice: null,
    branchOfficeById: null,
    resp: null,
  },
  getters: {
    getsBranchOffice: state => state.branchOffice,
    getsBranchOfficeById: state => state.branchOfficeById,
  },
  mutations: {
    SET_BRANCH_OFFICE: (state, payload) => {
      state.branchOffice = payload
    },
    SET_BRANCH_OFFICE_BY_ID: (state, payload) => {
      state.branchOfficeById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_BRANCH_OFFICE: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_BRANCH_OFFICE(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_BRANCH_OFFICE', resp.data.data)
          }
      })
    },
    GET_BRANCH_OFFICE_BY_ID: async ({ commit }, id) => {
      return await GET_BRANCH_OFFICE_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_BRANCH_OFFICE_BY_ID', resp.data.data)
          }
      })
    },
    ADD_BRANCH_OFFICE: async ({ commit }, args) => {
      await ADD_BRANCH_OFFICE(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_BRANCH_OFFICE: async ({ commit }, args) => {
      await UPDATE_BRANCH_OFFICE(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_BRANCH_OFFICE: async ({ commit }, id) => {
      await DELETE_BRANCH_OFFICE(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
