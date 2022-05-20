import queryString from 'query-string'

import {
  GET_EMPLOYEE,
  GET_EMPLOYEE_BY_ID,
  ADD_EMPLOYEE,
  UPDATE_EMPLOYEE,
  DELETE_EMPLOYEE,
} from '../../../../api/master-data/organization/employee'

export default {
  namespaced: true,
  state: {
    employee: null,
    employeeById: null,
    resp: null,
  },
  getters: {
    getsEmployee: state => state.employee,
    getsEmployeeById: state => state.employeeById,
  },
  mutations: {
    SET_EMPLOYEE: (state, payload) => {
      state.employee = payload
    },
    SET_EMPLOYEE_BY_ID: (state, payload) => {
      state.employeeById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_EMPLOYEE: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_EMPLOYEE(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_EMPLOYEE', resp.data.data)
          }
      })
    },
    GET_EMPLOYEE_BY_ID: async ({ commit }, id) => {
      return await GET_EMPLOYEE_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_EMPLOYEE_BY_ID', resp.data.data)
          }
      })
    },
    ADD_EMPLOYEE: async ({ commit }, args) => {
      await ADD_EMPLOYEE(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_EMPLOYEE: async ({ commit }, args) => {
      await UPDATE_EMPLOYEE(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_EMPLOYEE: async ({ commit }, id) => {
      await DELETE_EMPLOYEE(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
