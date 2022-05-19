import axios from '@axios'

export const GET_USER = params => axios.get(`/datamaster/get/pengguna?${params}`)

export const GET_USER_BY_ID = id => axios.get(`/datamaster/get/pengguna/${id}`)

export const ADD_USER = data => axios.post('/datamaster/create/pengguna/', data)

export const UPDATE_USER = data => axios.put(`/datamaster/update/pengguna/${data.user_code}`, data)

export const DELETE_USER = id => axios.delete(`/datamaster/delete/pengguna/${id}`)
