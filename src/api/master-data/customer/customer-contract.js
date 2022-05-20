import axios from '@axios'

export const GET_CUSTOMER_CONTRACT = params => axios.get(`/datamaster/get/customer-contract?${params}`)

export const GET_CUSTOMER_CONTRACT_BY_ID = id => axios.get(`/datamaster/get/customer-contract/${id}`)

export const ADD_CUSTOMER_CONTRACT = data => axios.post('/datamaster/create/customer-contract/', data)

export const UPDATE_CUSTOMER_CONTRACT = data => axios.put(`/datamaster/update/customer-contract/${data.contract_number}`, data)

export const DELETE_CUSTOMER_CONTRACT = id => axios.delete(`/datamaster/delete/customer-contract/${id}`)
