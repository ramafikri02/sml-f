import axios from '@axios'

export const GET_ROLE = params => axios.get(`/datamaster/get/role?${params}`)

export const GET_ROLE_BY_ID = id => axios.get(`/datamaster/get/role/${id}`)

export const ADD_ROLE = data => axios.post('/datamaster/create/role/', data)

export const UPDATE_ROLE = data => axios.put(`/datamaster/update/role/${data.role_code}`, data)

export const DELETE_ROLE = id => axios.delete(`/datamaster/delete/role/${id}`)
