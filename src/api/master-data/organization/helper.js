import axios from '@axios'

export const GET_HELPER = params => axios.get(`/datamaster/get/helper?${params}`)

export const GET_HELPER_BY_ID = id => axios.get(`/datamaster/get/helper/${id}`)

export const ADD_HELPER = data => axios.post('/datamaster/create/helper/', data)

export const UPDATE_HELPER = data => axios.put(`/datamaster/update/helper/${data.courier_code}`, data)

export const DELETE_HELPER = id => axios.delete(`/datamaster/delete/helper/${id}`)
