import axios from '@axios'

export const GET_BRANCH_OFFICE = params => axios.get(`/datamaster/get/branch-office?${params}`)

export const GET_BRANCH_OFFICE_BY_ID = id => axios.get(`/datamaster/get/branch-office/${id}`)

export const ADD_BRANCH_OFFICE = data => axios.post('/datamaster/create/branch-office/', data)

export const UPDATE_BRANCH_OFFICE = data => axios.put(`/datamaster/update/branch-office/${data.branch_office_code}`, data)

export const DELETE_BRANCH_OFFICE = id => axios.delete(`/datamaster/delete/branch-office/${id}`)
