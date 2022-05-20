import axios from '@axios'

export const GET_COURIER = params => axios.get(`/datamaster/get/courier?${params}`)

export const GET_COURIER_BY_ID = id => axios.get(`/datamaster/get/courier/${id}`)

export const ADD_COURIER = data => axios.post('/datamaster/create/courier/', data)

export const UPDATE_COURIER = data => axios.put(`/datamaster/update/courier/${data.courier_code}`, data)

export const DELETE_COURIER = id => axios.delete(`/datamaster/delete/courier/${id}`)
