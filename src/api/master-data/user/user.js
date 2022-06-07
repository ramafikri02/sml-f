import axios from '@axios'

export const GET_USER = params => axios.get(`/datamaster/get/user?${params}`)

export const GET_USER_BY_ID = id => axios.get(`/datamaster/get/user/${id}`)

export const ADD_USER = data => axios.post('/datamaster/create/user/', data)

export const UPDATE_USER = data => axios.put(`/datamaster/update/user/${data.user_code}`, data)

export const DELETE_USER = id => axios.delete(`/datamaster/delete/user/${id}`)
