import axios from '@axios'

export const GET_PIC_INVOICE = params => axios.get(`/datamaster/get/pic-invoice?${params}`)

export const GET_PIC_INVOICE_BY_ID = id => axios.get(`/datamaster/get/pic-invoice/${id}`)

export const ADD_PIC_INVOICE = data => axios.post('/datamaster/create/pic-invoice/', data)

export const UPDATE_PIC_INVOICE = data => axios.put(`/datamaster/update/pic-invoice/${data.id_invoice}`, data)

export const DELETE_PIC_INVOICE = id => axios.delete(`/datamaster/delete/pic-invoice/${id}`)
