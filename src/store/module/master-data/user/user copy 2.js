import queryString from 'query-string'

import {
  GET_USER,
  GET_USER_BY_ID,
} from '../../../../api/master-data/user/user'

const state = {
  user: null,
  userById: null
}

const mutations = {
  SET_USER: (states, payload) => {
    // for (let i = 0; i < payload.length; i++) {
    //   payload[i]['img_user'] = JSON.parse(payload[i].img_user)
    // }
    states.user = payload
  },
  SET_USER_BY_ID: (states, payload) => {
    states.userById = payload
  },
}

const actions = {
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
}

const getters = {
  getsUser: states => states.user,
  getsUserById: states => states.userById,
}

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters,
}
