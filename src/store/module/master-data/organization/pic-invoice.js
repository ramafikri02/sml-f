import queryString from 'query-string'

import {
  GET_PIC_INVOICE,
  GET_PIC_INVOICE_BY_ID,
  ADD_PIC_INVOICE,
  UPDATE_PIC_INVOICE,
  DELETE_PIC_INVOICE,
} from '../../../../api/master-data/organization/pic-invoice'

export default {
  namespaced: true,
  state: {
    picInvoice: null,
    picInvoiceById: null,
    resp: null,
  },
  getters: {
    getsPicInvoice: state => state.picInvoice,
    getsPicInvoiceById: state => state.picInvoiceById,
  },
  mutations: {
    SET_PIC_INVOICE: (state, payload) => {
      state.picInvoice = payload
    },
    SET_PIC_INVOICE_BY_ID: (state, payload) => {
      state.picInvoiceById = payload
    },
    SET_RESP: (states, payload) => {
      states.resp = payload;
    },  
  },
  actions: {
    GET_PIC_INVOICE: async ({ commit }, args) => {
      let params = queryString.stringify(args)
      return await GET_PIC_INVOICE(params)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_PIC_INVOICE', resp.data.data)
          }
      })
    },
    GET_PIC_INVOICE_BY_ID: async ({ commit }, id) => {
      return await GET_PIC_INVOICE_BY_ID(id)
      .then((resp) => {
          if (resp.status === 200) {
              commit('SET_PIC_INVOICE_BY_ID', resp.data.data)
          }
      })
    },
    ADD_PIC_INVOICE: async ({ commit }, args) => {
      await ADD_PIC_INVOICE(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    UPDATE_PIC_INVOICE: async ({ commit }, args) => {
      await UPDATE_PIC_INVOICE(args)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
    DELETE_PIC_INVOICE: async ({ commit }, id) => {
      await DELETE_PIC_INVOICE(id)
        .then((resp) => {
          if (resp.status === 200) {
            commit('SET_RESP', resp);
          }
        });
    },
  
  },
}
