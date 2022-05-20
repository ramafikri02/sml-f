import axios from '@axios'

export const GET_EMPLOYEE = params => axios.get(`/datamaster/get/employee?${params}`)

export const GET_EMPLOYEE_BY_ID = id => axios.get(`/datamaster/get/employee/${id}`)

export const ADD_EMPLOYEE = data => axios.post('/datamaster/create/employee/', data)

export const UPDATE_EMPLOYEE = data => axios.put(`/datamaster/update/employee/${data.employee_code}`, data)

export const DELETE_EMPLOYEE = id => axios.delete(`/datamaster/delete/employee/${id}`)
