import axios from '@axios'

export const GET_BRANCH = params => axios.get(`/datamaster/get/branch?${params}`)

export const GET_BRANCH_BY_ID = id => axios.get(`/datamaster/get/branch/${id}`)

export const ADD_BRANCH = data => axios.post('/datamaster/create/branch/', data)

export const UPDATE_BRANCH = data => axios.put(`/datamaster/update/branch/${data.branch_code}`, data)

export const DELETE_BRANCH = id => axios.delete(`/datamaster/delete/branch/${id}`)
