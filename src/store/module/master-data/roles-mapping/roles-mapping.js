import queryString from 'query-string'

import {
  GET_ROLE,
  GET_ROLE_BY_ID,
  ADD_ROLE,
  UPDATE_ROLE,
  DELETE_ROLE,
} from '../../../../api/master-data/roles-mapping'

export default {
  namespaced: true,
  state: {
    role: null,
    roleById: null,
    resp: null,
  },
  getters: {
    getsRole: state => state.role,
    getsRoleById: state => state.roleById,
  },
  mutations: {
    SET_ROLE: (state, payload) => {
      state.role = payload
    },
    SET_ROLE_BY_ID: (state, payload) => {
      state.roleById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_ROLE: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_ROLE(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_ROLE', resp.data.data)
          }
      })
    },
    GET_ROLE_BY_ID: async ({ commit }, id) => {
      return await GET_ROLE_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_ROLE_BY_ID', resp.data.data)
          }
      })
    },
    ADD_ROLE: async ({ commit }, args) => {
      await ADD_ROLE(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_ROLE: async ({ commit }, args) => {
      await UPDATE_ROLE(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_ROLE: async ({ commit }, id) => {
      await DELETE_ROLE(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
