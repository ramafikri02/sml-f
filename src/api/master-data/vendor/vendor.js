import axios from '@axios'

export const GET_VENDOR = params => axios.get(`/datamaster/get/vendor?${params}`)

export const GET_VENDOR_BY_ID = id => axios.get(`/datamaster/get/vendor/${id}`)

export const ADD_VENDOR = data => axios.post('/datamaster/create/vendor/', data)

export const UPDATE_VENDOR = data => axios.put(`/datamaster/update/vendor/${data.vendor_code}`, data)

export const DELETE_VENDOR = id => axios.delete(`/datamaster/delete/vendor/${id}`)
