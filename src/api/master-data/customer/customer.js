import axios from '@axios'

export const GET_CUSTOMER = params => axios.get(`/datamaster/get/customer?${params}`)

export const SEARCH_CUSTOMER = params => axios.get(`/datamaster/search/customer?${params}`)

export const GET_CUSTOMER_BY_ID = id => axios.get(`/datamaster/get/customer/${id}`)

export const ADD_CUSTOMER = data => axios.post('/datamaster/create/customer/', data)

export const UPDATE_CUSTOMER = data => axios.put(`/datamaster/update/customer/${data.customer_code}`, data)

export const DELETE_CUSTOMER = id => axios.delete(`/datamaster/delete/customer/${id}`)
