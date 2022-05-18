import queryString from 'query-string'

import {
  GET_USER,
  GET_USER_BY_ID,
} from '../../../../api/master-data/user'

export default {
  namespaced: true,
  state: {
    user: null,
    userById: null
  },
  getters: {
    getsUser: state => state.user,
    getsUserById: state => state.userById,
  },
  mutations: {
    SET_USER: (state, payload) => {
      // for (let i = 0; i < payload.length; i++) {
      //   payload[i]['img_user'] = JSON.parse(payload[i].img_user)
      // }
      state.user = payload
    },
    SET_USER_BY_ID: (state, payload) => {
      state.userById = payload
    },
  },
  actions: {
    GET_USER: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_USER(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_USER', resp.data.data)
          }
      })
    },
    GET_USER_BY_ID: async ({ commit }, id) => {
      return await GET_USER_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_USER_BY_ID', resp.data.data)
          }
      })
    },
  },
}
